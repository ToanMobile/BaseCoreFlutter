import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controllers/base/base_controller.dart';
import '../../data/repositories/common_repository.dart';
import '../app/app_pages.dart';
import '../data/api/models/document_entity.dart';
import '../data/api/models/request/enums.dart';
import '../data/api/models/response/upload/upload_entity.dart';
import '../data/api/services/request_service.dart';
import '../data/repositories/request_repository.dart';
import '../res/style.dart';
import '../share/libraries/logger/flutter_logger.dart';
import '../share/util/common_utils.dart';

class CaptureController extends BaseController {
  final commonRepository = Get.find<CommonRepository>();
  final requestRepository = Get.find<RequestRepository>();
  RxBool isCameraWidget = true.obs;
  RxBool isEditEnable = false.obs;

  VIN_TYPE get captureIndex => _captureIndex.value;
  final Rx<VIN_TYPE> _captureIndex = VIN_TYPE.VIN_ID.obs;
  final TextEditingController editVinIDController = TextEditingController()..text = '';
  List<DocumentsEntity> listImageCapture = [];

  //Camera
  CameraController? cameraController;
  ImageCropper imageCropper = ImageCropper();
  RxBool isCameraInit = false.obs;
  var isUpdateRequest = false;

  @override
  void onReady() async {
    super.onReady();
    orientation(isLandscape: true);
    isCameraCapture = true;
    if (await Permission.camera.request().isGranted) {
      availableCameras().then((value) {
        _displayCamera(value.first);
      });
    }
  }

  void _displayCamera(CameraDescription? camera) {
    if (camera != null) {
      cameraController = CameraController(camera, ResolutionPreset.max);
      cameraController?.initialize().then((_) async {
        await cameraController?.lockCaptureOrientation(Platform.isAndroid ? DeviceOrientation.landscapeLeft : DeviceOrientation.landscapeRight);
        isCameraInit.value = true;
      });
    }
  }

  // String _originalPath = '';
  // Image? imageFuck;
  Future<String> takeShoot() async {
    try {
      XFile? xFile = await cameraController?.takePicture();
      if (xFile == null) return '';
      if (!isVinID) {
        File? file = await _cropImage(xFile);
        if (file != null) {
          return file.path;
        } else {
          return '';
        }
      } else {
        return xFile.path;
      }
    } catch (e) {
      return '';
    }
  }

  Future<File?> _cropImage(XFile xFile) async {
    File? croppedImage = (await imageCropper.cropImage(
      sourcePath: xFile.path,
      maxWidth: Get.width.toInt(),
      maxHeight: Get.height.toInt(),
    )) as File?;
    return croppedImage;
  }

  void getFromCamera(String pickedFile) async {
    if (pickedFile.isNotEmpty) {
      if (isVinID) {
        try {
          //await ImageProcessor.cropSquare(pickedFile, pickedFile, false);
          //GallerySaver.saveImage(pickedFile);
          //editVinIDController.text = await _ocrService.detectText(pickedFile);
          isCameraWidget.value = false;
          Logger.e("getFromCamera::" + editVinIDController.text);
        } catch (e) {
          isCameraWidget.value = false;
        }
      } else {
        Logger.e("getFromCamera::" + captureIndex.name);
        isCameraWidget.value = false;
        Logger.e("listImageCapture::" + listImageCapture.toString());
      }
    }
  }

  void retakePhoto() {
    isCameraWidget.value = true;
  }

  get isVinID => captureIndex == VIN_TYPE.VIN_ID || captureIndex == VIN_TYPE.ODOMETER;

  get isOdometer => captureIndex == VIN_TYPE.ODOMETER;

  get isCapture => isCameraWidget.value;

  get isCropImage => !isVinID;

  void onSkip() async {
    switch (_captureIndex.value) {
      case VIN_TYPE.VIN_ID:
        _captureIndex.value = VIN_TYPE.FRONT;
        break;
      case VIN_TYPE.FRONT:
        _captureIndex.value = VIN_TYPE.LEFT;
        //TODO
        //await updateRequest();
        break;
      case VIN_TYPE.LEFT:
        _captureIndex.value = VIN_TYPE.RIGHT;
        break;
      case VIN_TYPE.RIGHT:
        _captureIndex.value = VIN_TYPE.REAR;
        break;
      case VIN_TYPE.REAR:
        _captureIndex.value = VIN_TYPE.WHELL;
        break;
      case VIN_TYPE.WHELL:
        editVinIDController.clear();
        _captureIndex.value = VIN_TYPE.ODOMETER;
        break;
      case VIN_TYPE.ODOMETER:
        await updateRequest();
        break;
    }
  }

  void goNextScreen() async {
    if (captureIndex == VIN_TYPE.VIN_ID && editVinIDController.text.isEmpty) {
      showSnackBar(LocalString.errorInputVinDI);
      return;
    }
    if (isOdometer && !editVinIDController.text.isNumericOnly) {
      showSnackBar(LocalString.documentOdometerFormat);
      return;
    }
    if (captureIndex != VIN_TYPE.ODOMETER) {
      retakePhoto();
    }
    switch (_captureIndex.value) {
      case VIN_TYPE.VIN_ID:
        _captureIndex.value = VIN_TYPE.FRONT;
        isCameraCapture = false;
        orientation();
        Get.toNamed(AppRoutes.REQUEST_VIN_ID, arguments: editVinIDController.text.isNotEmpty ? editVinIDController.text : '')?.then((value) {
          orientation(isLandscape: true);
          isCameraCapture = true;
          if (value) {
            _captureIndex.value = VIN_TYPE.FRONT;
          } else {
            _captureIndex.value = VIN_TYPE.VIN_ID;
          }
        });
        break;
      case VIN_TYPE.FRONT:
        _captureIndex.value = VIN_TYPE.LEFT;
        //TODO
        //await updateRequest();
        break;
      case VIN_TYPE.LEFT:
        _captureIndex.value = VIN_TYPE.RIGHT;
        break;
      case VIN_TYPE.RIGHT:
        _captureIndex.value = VIN_TYPE.REAR;
        break;
      case VIN_TYPE.REAR:
        _captureIndex.value = VIN_TYPE.WHELL;
        break;
      case VIN_TYPE.WHELL:
        editVinIDController.clear();
        _captureIndex.value = VIN_TYPE.ODOMETER;
        break;
      case VIN_TYPE.ODOMETER:
        await updateRequest();
        break;
    }
  }

  void showInfo() {
    //Todo
  }

  void onEdit() {
    if (isEditEnable.value && ((editVinIDController.text.length < 13 || editVinIDController.text.length >= 20) && captureIndex == VIN_TYPE.VIN_ID)) {
      showSnackBar(LocalString.errorInputVinDI);
    } else {
      isEditEnable.value = !isEditEnable.value;
    }
  }

  Future<UploadEntity?> uploadImage(String imagePath) async => await commonRepository.uploadImage(imagePath);

  Future<void> updateRequest() async {
    if (isUpdateRequest) return;
    isUpdateRequest = true;
    Logger.e('listImageCapture::' + listImageCapture.toString());
    Logger.e('hashId::' + RequestService.createRequestRequest.hashId.toString());
    if (RequestService.createRequestRequest.hashId == null) {
      showSnackBar(LocalString.notificationContent);
      return;
    }
    try {
      if (listImageCapture.isNotEmpty) {
        RequestService.createRequestRequest.documents.addAll(listImageCapture);
      }
      RequestService.createRequestRequest.step = STEP_TYPE.STEP1.name;
      Logger.e('createRequestRequest::' + RequestService.createRequestRequest.toString());
      await requestRepository.updateRequest(RequestService.createRequestRequest.hashId, RequestService.createRequestRequest).then((value) {
        isUpdateRequest = false;
        isCameraCapture = false;
        orientation();
        Get.offNamed(AppRoutes.DOCUMENT);
      });
    } catch (e) {
      isUpdateRequest = false;
      showErrors(e);
    }
  }

  void closeVinIDScreen() {
    isCameraCapture = false;
    orientation();
    Get.back();
  }

  @override
  void onClose() {
    isCameraCapture = false;
    orientation();
    super.onClose();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    editVinIDController.dispose();
    super.dispose();
  }
}

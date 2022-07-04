import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/camera_controller.dart';
import '../../../data/api/models/request/enums.dart';
import '../../../res/style.dart';
import '../../../share/widget/icon/icons_component.dart';
import '../../base/base_page.dart';
import '../../base/base_scaffold.dart';
import '../button/base.button.dart';
import '../button/touchable_opacity.dart';
import '../input/ctext_form_field.dart';

const widthVin = 370.0;
const heightVin = 70.0;
const screenTopPadding = 10.0;
const screenBottomPadding = 10.0;
const screenLeftPadding = 40.0;

class BaseCamera extends BasePage<CaptureController> {
  final Function(String) onCapture;
  final VoidCallback? onRetake;
  final VoidCallback? onShowInfo;
  final VoidCallback? onClose;
  final VoidCallback? onNext;
  final VoidCallback? onEdit;
  final VoidCallback? onSkip;

  const BaseCamera({
    Key? key,
    required this.onCapture,
    this.onRetake,
    this.onShowInfo,
    this.onClose,
    this.onNext,
    this.onEdit,
    this.onSkip,
  }) : super(key: key);

  Future<String> takeShoot() async {
    return await controller.takeShoot();
  }

  @override
  Widget buildContentView(BuildContext context, CaptureController controller) {
    return BaseScaffold(
      resizeToAvoidBottomInset: true,
      isPaddingDefault: false,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: controller.isCameraInit.value ? buildWidgetCameraPreview(context) : const SizedBox(),
            ),
          ),
          _drawGrayScreen(),
          controller.isCameraInit.value ? _buildRectangle() : const SizedBox(),
          _buildEditVinID(),
          _buildTitle(context),
          _buildRetakeButton(),
          _buildCloseButton(),
          _buildIconCameraWidget(context),
          _buildInfoAndNextButton()
        ],
      ),
    );
  }

  buildWidgetCameraPreview(BuildContext context) {
    if (Platform.isAndroid) {
      return AspectRatio(
        aspectRatio: controller.isCropImage ? (controller.cameraController?.value.aspectRatio ?? Get.width / Get.height) : widthVin / heightVin,
        child: RotatedBox(
          quarterTurns: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 1,
          child: controller.cameraController?.buildPreview(),
        ),
      );
    } else {
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AspectRatio(
            aspectRatio: controller.isCropImage ? (controller.cameraController?.value.aspectRatio ?? Get.width / Get.height) : widthVin / heightVin,
            child: RotatedBox(
              quarterTurns: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 1,
              child: controller.cameraController?.buildPreview(),
            ),
          ),
          controller.cameraController?.buildPreview() ?? const SizedBox.shrink(),
        ],
      );
    }
  }

  //UI
  Widget _drawGrayScreen() {
    return !controller.isCropImage
        ? ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.srcOut,
            ), // This one will create the magic
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ), // This one will handle background + difference out
                ),
                controller.isCapture
                    ? Center(
                        child: Container(
                          height: heightVin,
                          width: widthVin,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _buildRectangle() => controller.isCapture && !controller.isCropImage
      ? Center(
          child: SizedBox(
            height: heightVin,
            width: widthVin,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Assets.svg.camera.iconRectangle3630.svg(),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(90 / 360),
                    child: Assets.svg.camera.iconRectangle3630.svg(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(270 / 360),
                    child: Assets.svg.camera.iconRectangle3630.svg(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(180 / 360),
                    child: Assets.svg.camera.iconRectangle3630.svg(),
                  ),
                ),
              ],
            ),
          ),
        )
      : const SizedBox.shrink();

  Widget _buildEditVinID() => !controller.isCapture && !controller.isCropImage
      ? Positioned(
          left: 0,
          right: 60,
          top: 0,
          bottom: 0,
          child: _buildEditText(),
        )
      : const SizedBox.shrink();

  Widget _buildEditText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widthVin,
            child: CTextFormField(
              isEditEnable: controller.isEditEnable.value,
              controller: controller.editVinIDController,
              hintLabel: LocalString.inputVinDI,
              textStyle: text24.textBlackColor,
              textInputType: controller.isOdometer ? TextInputType.number : TextInputType.text,
            ),
          ),
          const SizedBox(width: 5),
          !controller.isEditEnable.value
              ? TouchableOpacity(
                  child: buildRowImageTextIcon(Assets.svg.camera.iconEdit.svg(), LocalString.edit),
                  onPressed: onEdit,
                )
              : TouchableOpacity(
                  child: buildRowImageTextIcon(Assets.svg.iconCheck.svg(), LocalString.done),
                  onPressed: onEdit,
                )
        ],
      );

  Widget _buildTitle(BuildContext context) {
    return Positioned(
      top: screenTopPadding,
      child: SizedBox(
        width: context.isPortrait ? Get.height : Get.width,
        child: Center(
          child: Text(
            getTitle(),
            style: text24.bold.textWhiteColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
    return Positioned(
      top: screenTopPadding,
      left: screenLeftPadding,
      child: BaseButton(
        child: buildRowImageTextIcon(Assets.svg.iconClose.svg(), LocalString.close),
        onPressed: onClose,
        style: buttonStyle,
      ),
    );
  }

  Widget _buildRetakeButton() {
    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
    return !controller.isCapture
        ? Positioned(
            top: screenTopPadding,
            right: screenLeftPadding,
            child: BaseButton(
              child: buildRowImageTextIcon(Assets.svg.camera.iconReload.svg(), LocalString.retake),
              onPressed: onRetake,
              style: buttonStyle,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildInfoAndNextButton() {
    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
    ButtonStyle buttonNextStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    );
    return Positioned(
      left: screenLeftPadding,
      right: screenLeftPadding,
      bottom: screenTopPadding,
      top: Get.height - 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseButton(
            child: buildRowImageTextIcon(
              Assets.svg.iconInfo.svg(),
              getTitleInfo(),
            ),
            onPressed: onShowInfo,
            style: buttonStyle,
          ),
          controller.isCapture && !controller.isCropImage
              ? const SizedBox.shrink()
              : BaseButton(
                  child: buildRowTextImageIcon(
                    Assets.svg.iconArrow.svg(color: Colors.black),
                    controller.isCapture && controller.captureIndex != VIN_TYPE.VIN_ID ? LocalString.skip : LocalString.next,
                    textStyle: text20.textBlackColor,
                  ),
                  onPressed: controller.isCapture && controller.captureIndex != VIN_TYPE.VIN_ID ? onSkip : onNext,
                  style: buttonNextStyle,
                ),
        ],
      ),
    );
  }

  _buildIconCameraWidget(BuildContext context) => Positioned(
        right: screenTopPadding,
        child: SizedBox(
          height: context.isLandscape ? Get.height : Get.width,
          child: Center(
            child: IconButton(
              iconSize: 120,
              icon: Assets.svg.camera.iconCamera.svg(),
              onPressed: () async {
                onCapture(await takeShoot());
              },
            ),
          ),
        ),
      );

  String getTitle() {
    switch (controller.captureIndex) {
      case VIN_TYPE.VIN_ID:
        return LocalString.captureVin;
      case VIN_TYPE.FRONT:
        return LocalString.captureFront;
      case VIN_TYPE.LEFT:
        return LocalString.captureLeft;
      case VIN_TYPE.RIGHT:
        return LocalString.captureRight;
      case VIN_TYPE.REAR:
        return LocalString.captureRear;
      case VIN_TYPE.WHELL:
        return LocalString.captureWhell;
      case VIN_TYPE.ODOMETER:
        return LocalString.captureOdometer;
    }
  }

  String getTitleInfo() {
    if (controller.isCropImage) {
      return LocalString.whereVehicle;
    } else {
      return LocalString.whereVinID;
    }
  }
}

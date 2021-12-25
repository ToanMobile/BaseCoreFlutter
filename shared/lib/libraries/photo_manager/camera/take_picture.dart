import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/res/style_core.dart';

import '../photo_provider.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({Key? key, required this.camera}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  String imagePath = '';
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (await Permission.camera.request().isGranted) {
        _controller = CameraController(
          widget.camera,
          ResolutionPreset.max,
        );
        _initializeControllerFuture = _controller?.initialize();
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller != null
          ? Stack(
              children: [
                FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(child: CameraPreview(_controller!));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                if (imagePath != "") Center(child: _reviewPicture()),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: const EdgeInsets.only(right: 20, top: 65),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 32,
                          ))),
                )
              ],
            )
          : const SizedBox.shrink(),
      floatingActionButton: imagePath == "" ? _bottomAction() : _bottomActionPreview(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //bottomNavigationBar: _bottomAction(),
    );
  }

  Widget _reviewPicture() {
    return Container(
      child: Image.file(File(imagePath)),
    );
  }

  Widget _bottomAction() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: InkWell(
        child: Container(
          width: 70,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.white.withOpacity(0.75),
          ),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Colors.transparent,
              border: Border.all(width: 2, color: Colors.black),
            ),
          ),
        ),
        onTap: () async {
          try {
            await _initializeControllerFuture;
            final XFile? image = await _controller?.takePicture();
            setState(() {
              imagePath = image?.path ?? '';
            });
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }

  Widget _bottomActionPreview() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Text(
              'retake'.text,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            onTap: () {
              setState(() {
                imagePath = "";
              });
            },
          ),
          InkWell(
            child: Text(
              'use.photo'.text,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            onTap: () async {
              Navigator.of(context).pop(PhotoInfo(path: imagePath, isCamera: true));
            },
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_hackaton/pages/postEditor.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                     width: context.width,
                        height: context.height,
                    child: FittedBox(
                          fit: BoxFit.cover,
                          child: Container(
                            width: context.width,
                        height: context.height,
                            child: CameraPreview(cameraController)))),
                ),
                Container(
                  color: Colors.black.withOpacity(
                      0.8),
                ),

                Center(
                      child: Container(
                    width: context.width,
                    height: context.width,
                    child: ClipRect(
                      child: OverflowBox(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Container(
                            width: context.width,
                            height: context.height,
                            child: CameraPreview(cameraController),
                          ),
                        ),
                      ),
                    ),
                  )),
              

                GestureDetector(
                  onTap: () {
                    setState(() {
                      direction = direction == 0 ? 1 : 0;
                      startCamera(direction);
                    });
                  },
                  child:
                      button(Icons.flip_camera_android, Alignment.bottomLeft),
                ),
                GestureDetector(
                  onTap: () {
                    cameraController.takePicture().then((XFile? xfile) {
                      if (mounted) {
                        if (xfile != null) {
                          print("Picture saved to ${xfile.path}");
                          Get.to(PostEditor(xPhoto: xfile));
                        }
                      }
                    });
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: button(Icons.add_photo_alternate_outlined,
                      Alignment.bottomRight),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  bool isImage = false;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() async {
        isImage = false;
        Get.to(PostEditor(xPhoto: image));

        isImage = true;
      });
    } else {
      return;
    }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white,
          //     offset: Offset(2, 2),
          //     blurRadius: 10,
          //   ),
          // ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

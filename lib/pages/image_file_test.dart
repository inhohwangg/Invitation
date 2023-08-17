import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/upload_page_controller.dart';
import 'package:get/get.dart';

class ImageFileTest extends StatefulWidget {
  const ImageFileTest({super.key});

  @override
  State<ImageFileTest> createState() => _ImageFileTestState();
}

class _ImageFileTestState extends State<ImageFileTest> {
  @override
  Widget build(BuildContext context) {
    UploadController uploadController = Get.put(UploadController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Test',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                uploadController.cameraImageTest();
              },
              child: Text(
                'data',
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              uploadController.gelleryImageTest();
            },
            child: Text(
              'gallery Image Test',
            ),
          )
        ],
      ),
    );
  }
}

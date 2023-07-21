import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  late Rx<File?> pickFile;

  captureImageCamera() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    pickFile = Rx<File?>(File(pickedImageFile!.path));
    inspect(pickFile);
  }
}

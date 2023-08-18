import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'register_controller.dart';

class UploadController extends GetxController {
  late Rx<File?> pickFile;
  List resultList = [];

  // captureImageCamera() async {
  //   final pickedImageFile =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   pickFile = Rx<File?>(File(pickedImageFile!.path));
  //   inspect(pickFile);
  // }
  @override
  void onInit() async {
    super.onInit();
    await getToken();
    // await imageTest();
  }

  getToken() async {
    var res = await dio.post(
      'http://121.130.161.155:8090/api/admins/auth-with-password',
      data: {
        'identity': 'gractor@gractor.com',
        'password': '#Gractor1234',
      },
    );
    GetStorage().write('token', res.data['token']);
  }

  cameraImageTest() async {
    final pickedImagFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    FormData? fromData;
    if (pickedImagFile != null) {
      var file = File(pickedImagFile.path);

      // 1. 파일을 MultipartFile 로 변환
      var multiPartFile =
          await MultipartFile.fromFile(file.path, filename: file.path);

      // 2. FormData를 사용하여 데이터 전송
      fromData = FormData.fromMap({
        'mainImg': multiPartFile,
      });
    }

    if (fromData != null) {
      // fromData 가 null 이 아닌 경우에만 POST 를 보냄
      pickFile = Rx<File?>(File(pickedImagFile!.path));
      inspect(pickFile);
      var res = await dio.post(
        'http://121.130.161.155:8090/api/collections/wedding_post/records',
        options: Options(
          headers: {
            'Authorization': GetStorage().read('token'),
          },
        ),
        data: fromData,
      );
      print(res.data);
    }
  }

  gelleryImageTest() async {
    final pickFile = await ImagePicker().pickMultiImage();

    List multiPartFiles = [];
    for (int i = 0; i < pickFile.length; i++) {
      MultipartFile multipartFile = await MultipartFile.fromFile(pickFile[i].path);
      multiPartFiles.add(multipartFile);
    }
    FormData formData = FormData.fromMap({
      'subImg': multiPartFiles
    });
    var res = await dio.post(
      'http://121.130.161.155:8090/api/collections/wedding_post/records',
      options: Options(
        headers: {
          'Authorization': GetStorage().read('token'),
        },
      ),
      data: formData
    );
    inspect(res.data);
  }
}

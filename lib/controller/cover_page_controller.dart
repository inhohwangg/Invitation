// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';

import '../widget/global.dart';

class CoverPageController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController groomName = TextEditingController();
  TextEditingController brideName = TextEditingController();
  TextEditingController weddingDate = TextEditingController();
  TextEditingController weddingLoation = TextEditingController();
  RxString dayOfWeek = ''.obs;

  
  //! 청첩장 커버 데이터 만들기
  coverData() async {
    try {
      FormData? fromData;
      fromData = FormData.fromMap({
        "groomName": groomName.text,
        "brideName": brideName.text,
        "weddingDate": weddingDate.text,
        "weddingLocation": weddingLoation.text,
        "dayWeek": dayOfWeek.value,
      });

      var res = await dio.post(
        '$baseUrl/api/collections/wedding_cover/records',
        options: Options(headers: {
          'Authorization': GetStorage().read('token'),
        }),
        data: fromData,
      );
      inspect(res.data);
      Get.snackbar('표지 만들기 성공!', '표지가 성공적으로 만들어졌습니다.',backgroundColor: Colors.green[300],colorText: Colors.white);
    } catch (e) {
      Get.snackbar('표지 만들기 실패!', '필수값을 누락하였습니다.',backgroundColor: Colors.red[300],colorText: Colors.white);
      print('coverData Error');
      print(e);
    }
  }
}

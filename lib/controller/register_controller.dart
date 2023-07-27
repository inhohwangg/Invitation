// ignore_for_file: unused_local_variable, unnecessary_overrides, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/pages/login_page.dart';
import 'package:flutter_clone_project_tictok/pages/main_page.dart';
import 'package:flutter_clone_project_tictok/pages/register_success_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocketbase/pocketbase.dart';

Dio dio = Dio(BaseOptions(
  contentType: Headers.formUrlEncodedContentType,
  validateStatus: (status) => true,
));

final pb = PocketBase(dotenv.env['POCKETBASE_LINK'].toString());

class RegisterController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  // 회원가입 기능
  register(userName, userId, password) async {
    try {
      final authData = await pb.collection('users').authWithPassword(
            'manager@manager.com',
            '#manager1234',
          );

      final body = <String, dynamic>{
        "username": userName,
        "email": userId,
        "emailVisibility": true,
        "password": password,
        "passwordConfirm": password,
      };

      final record = await pb.collection('users').create(body: body);
      print(record);
// (optional) send an email verification request
      await pb.collection('users').requestVerification(userId);
      Get.snackbar('회원가입 성공!', '회원가입에 성공했습니다.');
      Get.to(
        RegisterSuccessPage(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 500,
        ),
      );
    } catch (e) {
      print(e);
      Get.snackbar('회원가입 실패!', '회원가입이 실패했습니다');
    }
  }

  // 로그인 기능
  login(userId, password) async {
    print('?!');
    try {
      final res = await pb.collection('users').authWithPassword(
            userId,
            password,
          );
      GetStorage().write('token', res.token);
      GetStorage().write('id', res.record?.id);
      GetStorage().write('collectionId', res.record?.collectionId);
      GetStorage().write('collectionName', res.record?.collectionName);
      GetStorage().write('email', res.record?.data['email']);
      GetStorage().write('username', res.record?.data['username']);
      Get.to(MainPage());
      Get.snackbar('로그인 성공', '환영합니다!',
          backgroundColor: Colors.blue[200], colorText: Colors.white);
      Get.to(
        MainPage(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 500,
        ),
      );
    } catch (e) {
      print(e);
      Get.snackbar('로그인 실패!', '아이디와 비밀번호를 확인해주세요',
          backgroundColor: Colors.red[200], colorText: Colors.white);
    }
  }
}

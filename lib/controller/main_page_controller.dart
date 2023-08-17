// ignore_for_file: unnecessary_overrides, avoid_print

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbase/pocketbase.dart';

class MainPageController extends GetxController {
  RxBool firstQuestion = false.obs;
  RxBool keyboardEvent = false.obs;
  List imageArray = [
    'https://source.unsplash.com/user/max_duz/300x300',
    'https://source.unsplash.com/random/?programming',
    'https://source.unsplash.com/random/300x300/?programming'
  ];
  final pb = 'http://121.130.161.155';
  // PocketBase(dotenv.env['POCKETBASE_LINK'].toString());

  @override
  void onInit() {
    super.onInit();
    // videoCreate();
  }

  videoCreate() async {
    final body = <String, dynamic>{
      "userId": "test",
      "userName": "test",
      "userProfileImage": "test",
      "videoId": "test",
      "likesList": "JSON",
      "artistSongName": "test",
      "videoUrl": "test",
      "descriptionTags": "test",
      "thumbnailUrl": "test",
      "publishedDateTime": 123,
      "totalComments": 123,
      "totalShares": 123
    };

    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);

    if (pickedFile != null) {
      var file = File(pickedFile.path);
      var formData = dio.FormData.fromMap({
        // dio 패키지의 FormData 클래스를 사용
        ...body,
        "videoFile": await dio.MultipartFile.fromFile(file.path,
            filename:
                file.path.split("/").last), // dio 패키지의 MultipartFile 클래스를 사용
      });

      dio.Dio dioClient = dio.Dio();
      final response = await dioClient.post(
        "$pb/api/collections/video/records",
        data: formData,
        // options: dio.Options(
        //   headers: {
        //     "Authorization": GetStorage().read(
        //       'token',
        //     ),
        //   },
        // ),
      );

      if (response.statusCode == 200) {
        print('데이터 생성 성공');
      } else {
        print('데이터 생성 실패');
      }
    } else {
      print('No video selected.');
    }
  }
}

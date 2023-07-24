import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InvatePostController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    invateData();
  }

  final String baseUrl = 'http://211.46.20.30:8090';
  Dio dio = Dio(BaseOptions(
    contentType: Headers.formUrlEncodedContentType,
    validateStatus: (status) => true,
  ));

  invateData() async {
    var res = await dio.get(
      '$baseUrl/api/collections/76c116klk171ds4/records?page=1&perPage=30&sort=-created&filter=&expand=',
      options: Options(
        headers: {
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTE0MTgwMzEsImlkIjoiZ295aWw0aHVzMW5iZDhuIiwidHlwZSI6ImFkbWluIn0.agKBIG-X6etk42EarzzIn0ndXl0QcdIcAJpMbiHQFAM',
        },
      ),
    );
    inspect(res.data);
  }
}

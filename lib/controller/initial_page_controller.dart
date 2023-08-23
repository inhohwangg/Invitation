import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../widget/global.dart';

class InitialPageController extends GetxController {
  // dotenv.env['POCKETBASE_LINK'].toString();
  RxList imageArray = [].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    var res = await dio.get('$baseUrl/api/collections/etcImage/records');
    GetStorage().write('collectionId', res.data['items'][0]['collectionId']);
    for (int i = 0; i < res.data['items'].length; i++) {
      imageArray.add(
          '$baseUrl/api/files/${GetStorage().read('collectionId')}/${res.data['items'][i]['id']}/${res.data['items'][i]['image']}');
    }
  }
}

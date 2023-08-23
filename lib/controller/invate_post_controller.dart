
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../widget/global.dart';

class InvatePostController extends GetxController {
  RxList invateDataList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    invateData();
  }


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
    for (int i = 0; i < res.data['items'].length; i++) {
      invateDataList.add({
        'attendanceMessage': res.data['items'][i]['attendanceMessage'],
        'brideBankAccount': res.data['items'][i]['brideBankAccount'],
        'brideFatherName': res.data['items'][i]['brideFatherName'],
        'brideMotherName': res.data['items'][i]['brideMotherName'],
        'brideName': res.data['items'][i]['brideName'],
        'busInfo': res.data['items'][i]['busInfo'],
        'collectionId': res.data['items'][i]['collectionId'],
        'collectionName': res.data['items'][i]['collectionName'],
        'galleryImage': res.data['items'][i]['galleryImage'],
        'groomBankAccount': res.data['items'][i]['groomBankAccount'],
        'groomFatherName': res.data['items'][i]['groomFatherName'],
        'groomMotherName': res.data['items'][i]['groomMotherName'],
        'groomName': res.data['items'][i]['groomName'],
        'invateImage':
            '$baseUrl/api/files/${res.data['items'][i]['collectionId']}/${res.data['items'][i]['id']}/${res.data['items'][i]['invateImage']}',
        'invitationMessage': res.data['items'][i]['invitationMessage'],
        'mainImage':
            '$baseUrl/api/files/${res.data['items'][i]['collectionId']}/${res.data['items'][i]['id']}/${res.data['items'][i]['mainImage']}',
        'parkingInfomation': res.data['items'][i]['parkingInfomation'],
        'subwayInfo': res.data['items'][i]['subwayInfo'],
        'weddingDate': res.data['items'][i]['weddingDate'],
        'weddingVenueNewAddress': res.data['items'][i]
            ['weddingVenueNewAddress'],
        'weddingVenueOldAddress': res.data['items'][i]
            ['weddingVenueOldAddress'],
        'weddingDayOfWeek': res.data['items'][i]['weddingDayOfWeek'],
        'weddingTime': res.data['items'][i]['weddingTime'],
        'weddingVenue': res.data['items'][i]['weddingVenue'],
      });
    }
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/invate_post_controller.dart';
import 'package:get/get.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String getMonthFromDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String month = '${date.month}';
    return month;
  }

  String getDayFromDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String day = '${date.day}';
    return day;
  }

  String getYearDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String year = '${date.year}';
    return year;
  }

  @override
  Widget build(BuildContext context) {
    InvatePostController controller = Get.put(InvatePostController());
    String weddingDate = controller.invateDataList[0]['weddingDate'];
    String formattedMonth = getMonthFromDate(weddingDate);
    String formattedDay = getDayFromDate(weddingDate);
    String formattedYear = getYearDate(weddingDate);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  inspect(controller.invateDataList[0]);
                },
                child: Container(
                  width: double.infinity,
                  height: 400,
                  child: Image.network(
                    controller.invateDataList[0]['mainImage'],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(controller.invateDataList[0]['groomName'],
                        textScaleFactor: 2),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(formattedMonth, textScaleFactor: 2),
                      ),
                      Text('ㅡ', textScaleFactor: 2),
                      Container(
                        child: Text(formattedDay, textScaleFactor: 2),
                      )
                    ],
                  ),
                  Container(
                    child: Text(controller.invateDataList[0]['brideName'],
                        textScaleFactor: 2),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Text(
                    '$formattedYear.$formattedMonth.$formattedDay ${controller.invateDataList[0]['weddingDayOfWeek']} ${controller.invateDataList[0]['weddingTime']}',
                    textScaleFactor: 2),
              ),
              SizedBox(
                height: 30,
              ),
              Text(controller.invateDataList[0]['weddingVenue'],
                  textScaleFactor: 1.5),
              SizedBox(
                height: 30,
              ),
              Text('INVITATION', textScaleFactor: 2),
              SizedBox(
                height: 10,
              ),
              Text('초대합니다.', textScaleFactor: 2),
              SizedBox(
                height: 30,
              ),
              Text('어제의 너와 내가 오늘을 우리가 되어', textScaleFactor: 1.2),
              SizedBox(
                height: 15,
              ),
              Text('저희 두 사람 이제 한길을 같이 걷고자 합니다.', textScaleFactor: 1.2),
              SizedBox(
                height: 15,
              ),
              Text('저희가 내딛는 첫 걸음에 부디 오셔서', textScaleFactor: 1.2),
              SizedBox(
                height: 15,
              ),
              Text('따뜻한 사랑으로 축복해 주시면 감사하겠습니다.', textScaleFactor: 1.2),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  controller.invateDataList[0]['invateImage'],
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.invateDataList[0]['groomFatherName'],
                      textScaleFactor: 1.5),
                  SizedBox(
                    width: 5,
                  ),
                  Text('·'),
                  Text(controller.invateDataList[0]['groomMotherName'],
                      textScaleFactor: 1.5),
                  SizedBox(
                    width: 5,
                  ),
                  Text('의 아들'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.invateDataList[0]['groomName'],
                      textScaleFactor: 1.5)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.invateDataList[0]['brideFatherName'],
                      textScaleFactor: 1.5),
                  SizedBox(
                    width: 5,
                  ),
                  Text('·'),
                  Text(controller.invateDataList[0]['brideMotherName'],
                      textScaleFactor: 1.5),
                  SizedBox(
                    width: 5,
                  ),
                  Text('의 아들'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.invateDataList[0]['brideName'],
                      textScaleFactor: 1.5)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.brown[100]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '연락하기',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

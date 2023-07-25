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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(controller.invateDataList[0]['groomName']),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(formattedMonth),
                      ),
                      Text('ㅡ'),
                      Container(
                        child: Text(formattedDay),
                      )
                    ],
                  ),
                  Container(
                    child: Text(controller.invateDataList[0]['brideName']),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    '$formattedYear.$formattedMonth.$formattedDay ${controller.invateDataList[0]['weddingDayOfWeek']} ${controller.invateDataList[0]['weddingTime']}'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(controller.invateDataList[0]['weddingVenue']),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                child: Image.network(
                  controller.invateDataList[0]['invateImage'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/cover_page_controller.dart';
import 'package:get/get.dart';

class CoverPage extends StatefulWidget {
  const CoverPage({super.key});

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    CoverPageController controller = Get.put(CoverPageController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[700],
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              '표지 만들기',
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! 1번
                  titleInput('1. 신랑 이름', context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  contentBox(
                    '신랑의 이름을 입력하세요',
                    context,
                    controller.groomName,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),

                  //! 2번
                  titleInput('2. 신부 이름', context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  contentBox(
                    '신부의 이름을 입력하세요',
                    context,
                    controller.brideName,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),

                  //! 3번
                  titleInput('3. 날짜와 시간', context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    onTap: () async {
                      print('object');
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      print(selectedDate);
                      if (selectedDate != null) {
                        controller.weddingDate.text =
                            selectedDate.toString().substring(0, 10);

                        List<String> weekdays = [
                          '월',
                          '화',
                          '수',
                          '목',
                          '금',
                          '토',
                          '일'
                        ];
                        String selectedWeekday =
                            weekdays[selectedDate.weekday - 1];
                        print("선택된 요일: $selectedWeekday");
                        controller.dayOfWeek.value = selectedWeekday;
                        inspect(controller.dayOfWeek.value);
                      }
                      print(controller.weddingDate.text);
                    },
                    child: IgnorePointer(
                      child: TextField(
                        controller: controller.weddingDate,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: '날짜와 시간을 입력하세요',
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.grey.withOpacity(
                              0.8,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),

                  //! 4번
                  titleInput('4. 결혼식 장소', context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  contentBox(
                    '결혼식 장소를 입력하세요',
                    context,
                    controller.weddingLoation,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('object');
                      controller.coverData();
                    },
                    child: Text(
                      '커버 만들기',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

titleInput(title, context) {
  return Container(
    child: Text(
      title,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),
    ),
  );
}

contentBox(content, context, TextEditingController controller) {
  return TextField(
    controller: controller,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      hintText: content,
      hintStyle: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.05,
        color: Colors.grey.withOpacity(
          0.8,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );
}

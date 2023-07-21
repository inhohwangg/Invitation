import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_project_tictok/controller/main_page_controller.dart';
import 'package:flutter_clone_project_tictok/pages/second_question_page.dart';
import 'package:get/get.dart';

class FirstQuestionPage extends StatefulWidget {
  const FirstQuestionPage({super.key});

  @override
  State<FirstQuestionPage> createState() => _FirstQuestionPageState();
}

class _FirstQuestionPageState extends State<FirstQuestionPage>
    with WidgetsBindingObserver {
  MainPageController controller = Get.put(MainPageController());
  bool keyboardEvent = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    focusNode.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance!.window.viewInsets.bottom;
    final newValue = bottomInset > 0;
    if (newValue != keyboardEvent) {
      setState(() {
        keyboardEvent = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        print(keyboardEvent);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: Text(
                        '신랑의 이름을 입력해주세요',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.075,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08,
                        vertical: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: TextField(
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          prefixIconColor: Colors.white,
                          suffixIconColor: Colors.white,
                          hintText: '신랑 이름',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: keyboardEvent
                          ? MediaQuery.of(context).viewInsets.bottom
                          : 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    color: Colors.black,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Get.to(
                          SecondQuestionPage(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                      child: Text('확인'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

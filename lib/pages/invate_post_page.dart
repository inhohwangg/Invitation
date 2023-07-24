import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvatePostPage extends StatefulWidget {
  const InvatePostPage({super.key});

  @override
  State<InvatePostPage> createState() => _InvatePostPageState();
}

class _InvatePostPageState extends State<InvatePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          '초대장 정보 작성',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신랑 이름'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신부 이름'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '결혼식 날짜'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '결혼식 장소(지번 주소)'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '결혼식 장소(도로명 주소)'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '참석멘트'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '초대 이름'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신랑 아버지 성함'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신랑 어머니 성함'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신부 아버지 성함'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신부 어머니 성함'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신랑 계좌번호'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '신부 계좌번호'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

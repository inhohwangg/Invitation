import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/pages/image_file_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/init_page.dart';
import 'pages/initial_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/maplibre_test_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin(); // 전역 변수로 설정

void main() async {
  // await dotenv.load(fileName: ".env");
  await GetStorage.init();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: selectNotification,
  );

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'important_notification', 'Important Notification',
      importance: Importance.max, priority: Priority.high, showWhen: false);

  final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(0, 'Important Alert',
      'This is an important message', platformChannelSpecifics,
      payload: 'item x');
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  runApp(MyApp());
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void selectNotification(NotificationResponse response) async {
  // Handle your notification tap
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: MapLibreTestPage(),
      home: ImageFileTest(),
    );
  }
}

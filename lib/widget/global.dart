import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';

Dio dio = Dio(BaseOptions(
  contentType: Headers.formUrlEncodedContentType,
  validateStatus: (status) => true,
));

final pb = PocketBase('http://fappworkspace.ddns.net:8090');

String baseUrl = 'http://fappworkspace.ddns.net:8090';
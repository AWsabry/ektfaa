// ignore_for_file: unused_element

import 'package:dio/dio.dart';

Map<String, String> _headers = <String, String>{
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://66.29.131.228:8000/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getdata({
    required url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  // }
}

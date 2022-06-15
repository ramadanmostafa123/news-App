// ignore_for_file: unnecessary_new

import 'package:dio/dio.dart';

class DioHelper {
  //static Dio? dio;
  static Dio dio = new Dio();

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}

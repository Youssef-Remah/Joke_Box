import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio jokeDio;

  static jokeInitializeApi()
  {
    jokeDio = Dio(
      BaseOptions(
        baseUrl: 'https://v2.jokeapi.dev/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getJoke({
    required String url,
    required Map<String, dynamic> params,
  }) async
  {
    return await jokeDio.get(url, queryParameters: params);
  }
}
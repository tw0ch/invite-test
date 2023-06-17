import 'package:dio/dio.dart';

abstract class ApiService {
  static const String url = 'https://run.mocky.io/v3';

  static Future<dynamic>? getRequest({required String request}) async {
    try {
      var response = await Dio().get('$url/$request');
      print(response);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}

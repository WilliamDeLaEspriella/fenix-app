import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:async';

import 'api_url.dart';
import 'platform.dart';

Future<Platform> getUSer() async {
//  final response = await http.get(ApiUrl.URL_LOGIN);
//  return postFromJson(response.body);
}

Future<Response> sign_in(e, p) async {
  Map<String, dynamic> body = {'email': e, 'password': p};
  Response response;
  try {
    response = await Dio().post(ApiUrl.URL_LOGIN, data: body);
  } on DioError catch (e) {
    print(e.response.data);
    return e.response;
  }
  return response;
}

Future<Response> sign_up(options) async {
  Map<String, dynamic> body = options;
  Response response;
  try {
    response = await Dio().post(ApiUrl.URL_SIGN_UP, data: body);
  } on DioError catch (e) {
    print(e.response.data);
    return e.response;
  }
  return response;
}

Future<Response> postPassword(e) async {
  Map<String, dynamic> body = {
    'session': {'email': e}
  };
  Response response;
//  final response = await http.post(ApiUrl.URL_LOGIN, body: json.encode(body));
  response = await Dio().post(ApiUrl.FORGOT_PASSWORD, data: body);
  return response;
}

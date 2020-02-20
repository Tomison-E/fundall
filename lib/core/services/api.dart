import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Api {
final String baseUrl ="https://test.fundall.io";
static String encodedCredentials;
final Map<String ,String> headers = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.acceptHeader:"application/json",// or whatever
  HttpHeaders.authorizationHeader: "Bearer $encodedCredentials",
};

Dio http = new Dio();

Future<Response> authenticate({@required String body}) async {
  final res = await http.post("$baseUrl/api/v1/login",options: Options(
    headers: headers
  ),data: body );
  return res;
}



Future<Response> register({@required String body}) async {
  final res = await http.post("$baseUrl/api/v1/register",options: Options(
      headers: headers
  ),data: body );
  return res;
}

Future<Response> getUser() async {
  final Map<String ,String> headers = {
    HttpHeaders.acceptHeader:"application/json",// or whatever
    HttpHeaders.authorizationHeader: "Bearer $encodedCredentials",
  };
  final res = await http.get("$baseUrl/api/v1/base/profile",options: Options(
      headers: headers
  ));
  return res;
}

Future<Response> updateAvatar({@required String image}) async {
   Map<String ,String> headers = {
     HttpHeaders.contentTypeHeader: "multipart/form-data; boundary=--------------------------663439186404114636296993",
    HttpHeaders.acceptHeader:"application/json",// or whatever
    HttpHeaders.authorizationHeader: "Bearer $encodedCredentials",
  };
   FormData formData = FormData.fromMap({
     "avatar": await MultipartFile.fromFile(image,filename:"avatar")
   });
  final res = await http.post("$baseUrl/api/v1/base/avatar",options: Options(
      headers: headers,
  ),data: formData );
  return res;
}

}
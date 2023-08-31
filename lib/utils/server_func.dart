import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_pos_app/constants.dart';

final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

final Dio dio = Dio(BaseOptions(baseUrl: Constants.hostUrl, headers: headers));
final Map<String, dynamic> returnDataError = {'result': "error"};

Future<Map<String, dynamic>> login(loginData) async {
  try {
    Response response = await dio.post(
      'admin/auth/login',
      data: json.encode(loginData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> loginData = response.data;

      if (loginData.isEmpty) {
        if (loginData["status"] == "success") {
          // store token
          await secureStorage.write(
              key: "accessToken", value: loginData["authorization"]["token"]);

          final Map<String, dynamic> returnData = {
            'id': loginData["authorization"]["id"],
            'name': loginData["authorization"]["name"]
          };
          return returnData;
        }
      } else {
        return returnDataError;
      }
      return {};
    } else {
      return returnDataError;
    }
  } catch (e) {
    return returnDataError;
  }
}

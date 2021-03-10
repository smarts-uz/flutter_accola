library service;

import 'dart:async';
import 'dart:convert';
import 'package:accoola/service/models/auth/login_request.dart';
import 'package:accoola/service/models/auth/login_response.dart';
import 'package:accoola/service/models/message_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class UsersApiProvider {


  Future<LoginResponseModel> postLogin(LoginRequestModel param) async {
    final response =
        await Api.post(url:"http://94.158.52.244:7005/MobileServise/hs/authorization/Users/CheckUser", data:param.toJson(),username: "APPAdministrator",password: "7501559");
    if (response.isSuccess) {
      try {
        LoginResponseModel token = LoginResponseModel.fromJson(response.result);
        final SharedPreferences prefs = await _prefs;
        prefs.setString('tokenData', json.encode(token.toJson()));

        return token;
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }

}

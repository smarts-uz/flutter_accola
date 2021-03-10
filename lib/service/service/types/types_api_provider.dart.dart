library service;

import 'dart:async';

import 'package:accoola/service/models/types/type_request.dart';
import 'package:accoola/service/models/types/type_response.dart';

import '../../api.dart';

class TypesApiProvider {
  Future<TypeResponseModel> post(TypeRequestModel param, String url) async {
    final response = await Api.post(
        url: url,
        data: param.toJson(),
        username: "COMuser",
        password: "COM1227");
    if (response.isSuccess) {
      try {
        TypeResponseModel token = TypeResponseModel.fromJson(response.result);

        return token;
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }
}

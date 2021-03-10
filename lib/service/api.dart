library api;

import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static Future<HttpResult> post({
    url,
    data,
    String username,
    String password,
  }) async {
    try {
      final dynamic headers =
          await _getReqHeader(username: username, password: password);
      http.Response res = await http.post(url, body: data, headers: headers);
      return _result(res);
    } catch (_) {
      return _result({});
    }
  }

  static HttpResult _result(response) {
    dynamic result;
    int status = response.statusCode ?? 404;

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      result = response.body;
      return HttpResult(true, result, status);
    } else {
      return HttpResult(false, "", status);
    }
  }

  static _getReqHeader({String username, String password}) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };
    return headers;
  }
}

class HttpResult {
  final bool isSuccess;
  final int status;
  final String result;

  HttpResult(this.isSuccess, this.result, this.status);
}

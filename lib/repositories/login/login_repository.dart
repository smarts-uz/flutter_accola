import 'dart:async';
import 'dart:convert';

import 'package:accoola/repositories/login/base_login_repositories.dart';
import 'package:accoola/service/models/loginrequest.dart';
import 'package:accoola/service/models/loginresp.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends BaseLoginRepository {
  final http.Client _httpClient;

  LoginRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<LoginResp> getResult(LoginRequest req) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('APPAdministrator:7501559'));
    try {
      final response = await _httpClient.post(
        'http://89.236.216.90/MobileServise/hs/authorization/Users/CheckUser',
        headers: {'authorization': basicAuth},
        body: jsonEncode(<String, dynamic>{
          'auth': {
            'login': '${req.auth.login}',
            'password': '${req.auth.password}'
          }
        }),
      );
      print('RESPONSE IS = ${response}');
      if (response.statusCode == 200) {
        return LoginResp.fromJson(jsonDecode(response.body));
      } else {
        print('DATA PRINTER = ${response.statusCode}');
        throw Exception('Failed to create album.');
      }
    } on TimeoutException catch (t_err) {
      throw Exception('TimeOut');
    } on Error catch (err) {
      throw Exception('Failed: $err');
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}

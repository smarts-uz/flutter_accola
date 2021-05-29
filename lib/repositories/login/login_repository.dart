import 'dart:async';
import 'dart:convert';

import 'package:accoola/contsant.dart';
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
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('$BASELOGINLOGIN:$BASEPASSWORDLOGIN'));
    try {
      final response = await _httpClient.post(
        Uri.parse(BASE_URL + BASE_HEADER),
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
        var resp = LoginResp.fromJson(jsonDecode(response.body));
        USERNAME = resp.auth.username;
        ROLE = resp.auth.role;
        baseID = resp.auth.base[0].baseID;
        return LoginResp.fromJson(jsonDecode(response.body));
      } else {
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

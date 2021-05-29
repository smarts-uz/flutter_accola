import 'dart:async';
import 'dart:convert';

import 'package:accoola/repositories/111/base_repository.dart';
import 'package:accoola/service/models/resp111.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../contsant.dart';

class Repository111 extends BaseRepository111 {
  final http.Client _httpClient;

  Repository111({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  void dispose() {
    _httpClient.close();
  }

  @override
  Future<String> getResult(
      {String login,
      String code,
      String password,
      String date,
      String dateN,
      String dateK}) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$BASELOGINREQ:$BASEPASSWORDREQ'));
    try {
      final response = await _httpClient.post(
        Uri.parse(BASE_URL + HEADER_WORK),
        headers: {'authorization': basicAuth},
        body: jsonEncode(<String, dynamic>{
          'auth': {'login': '$login', 'password': '$password'},
          'data': {
            'type': '$code',
            'date': '$date',
            'dateN': '$dateN',
            'dateK': '$dateK'
          }
        }),
      );
      print('RESPONSE IS = $response');
      if (response.statusCode == 200) {
        return response.body;
        //   return Resp111.fromJson(jsonDecode(response.body));
      } else {
        print('DATA PRINTER STATUS CODE= ${response.statusCode}');
        print('DATA PRINTER BODY = ${response.body}');
        print('DATA PRINTER response.request = ${response.request}');
        throw Exception('Failed to create album.');
      }
    } on TimeoutException catch (t_err) {
      throw Exception('TimeOut');
    } on Error catch (err) {
      throw Exception('Failed: $err');
    }
  }
}

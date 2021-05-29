import 'package:accoola/service/models/request.dart';
import 'package:accoola/service/models/resp111.dart';
import 'package:http/http.dart';

abstract class BaseRepository111 {
  Future<String> getResult(
      {String code,
      String login,
      String password,
      String date,
      String dateN,
      String dateK});

  void dispose();
}

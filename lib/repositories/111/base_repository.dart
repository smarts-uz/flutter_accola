import 'package:accoola/service/models/request.dart';
import 'package:accoola/service/models/resp111.dart';

abstract class BaseRepository111 {
  Future<Resp111> getResult(Request req);

  void dispose();
}

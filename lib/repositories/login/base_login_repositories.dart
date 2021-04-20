import 'package:accoola/service/models/loginrequest.dart';
import 'package:accoola/service/models/loginresp.dart';

abstract class BaseLoginRepository {
  Future<LoginResp> getResult(LoginRequest req);

  void dispose();
}

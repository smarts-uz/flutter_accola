import 'package:accoola/service/models/login_request.dart';
import 'package:accoola/service/models/login_response.dart';
import 'package:accoola/service/service/users/users_api_provider.dart';

class UsersRepository {
  UsersApiProvider _provider = UsersApiProvider();

  Future<LoginResponseModel> login(LoginRequestModel param) =>
      _provider.postLogin(param);
}

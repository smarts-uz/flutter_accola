import 'package:accoola/service/models/auth/login_request.dart';
import 'package:accoola/service/models/auth/login_response.dart';
import 'package:accoola/service/models/types/type_request.dart';
import 'package:accoola/service/models/types/type_response.dart';
import 'package:accoola/service/service/types/types_api_provider.dart.dart';

class TypeRepository {


  TypesApiProvider _provider = TypesApiProvider();
  Future<TypeResponseModel> getData(TypeRequestModel param, String url) =>
      _provider.post(param,url);
}

import 'package:accoola/service/models/types/type123_request.dart';
import 'package:accoola/service/models/types/type_response.dart';
import 'package:accoola/service/service/type_123/types_123_api_provider.dart.dart';

class Type123Repository {
  Types123ApiProvider _provider = Types123ApiProvider();

  Future<TypeResponseModel> getData(Type123RequestModel param, String url) =>
      _provider.post(param, url);
}

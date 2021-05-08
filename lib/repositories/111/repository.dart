import 'package:accoola/repositories/111/base_repository.dart';
import 'package:accoola/service/models/resp111.dart';
import 'package:accoola/service/models/request.dart';
import 'package:http/http.dart' as http;

class Repository111 extends BaseRepository111 {
  final http.Client _httpClient;

  Repository111({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client;

  @override
  void dispose() {}

  @override
  Future<Resp111> getResult(Request req) {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$BASELOGIN:$BASEPASSWORD'));
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
        baseID = resp.auth.base[0].baseID;
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
}

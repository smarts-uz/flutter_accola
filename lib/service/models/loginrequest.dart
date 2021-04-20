class LoginRequest {
  AuthReq auth;

  LoginRequest({this.auth});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    auth = json['auth'] != null ? new AuthReq.fromJson(json['auth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auth != null) {
      data['auth'] = this.auth.toJson();
    }
    return data;
  }
}

class AuthReq {
  String login;
  String password;

  AuthReq({this.login, this.password});

  AuthReq.fromJson(Map<String, dynamic> json) {
    login = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['password'] = this.password;
    return data;
  }
}

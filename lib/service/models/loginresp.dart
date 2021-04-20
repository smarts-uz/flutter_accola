import 'package:flutter/material.dart';

class LoginResp {
  bool status;
  Auth auth;

  LoginResp(jsonDecode, {this.status, @required this.auth});

  LoginResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    auth = json['auth'] != null ? new Auth.fromJson(json['auth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.auth != null) {
      data['auth'] = this.auth.toJson();
    }
    return data;
  }
}

class Auth {
  String username;
  String role;
  List<Base> base;

  Auth({this.username, this.role, this.base});

  Auth.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
    if (json['base'] != null) {
      base = new List<Base>();
      json['base'].forEach((v) {
        base.add(new Base.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['role'] = this.role;
    if (this.base != null) {
      data['base'] = this.base.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Base {
  String basename;
  String baseID;
  String login;
  String password;

  Base({this.basename, this.baseID, this.login, this.password});

  Base.fromJson(Map<String, dynamic> json) {
    basename = json['basename'];
    baseID = json['baseID'];
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['basename'] = this.basename;
    data['baseID'] = this.baseID;
    data['login'] = this.login;
    data['password'] = this.password;
    return data;
  }
}

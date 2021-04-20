import 'dart:async';

import 'package:accoola/repositories/login/login_repository.dart';
import 'package:accoola/service/models/loginrequest.dart';
import 'package:accoola/service/models/loginresp.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({
    @required this.repository,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginPressed) {
      yield* _loginProcess(event, event.request);
    }
    // else if (event is IsLoginnedBefore) {
    //   yield* _checkDbForLogin(event);
    // }
  }

  Stream<LoginState> _loginProcess(
      LoginPressed event, LoginRequest request) async* {
    yield LoginLoading();
    try {
      LoginResp response = await repository.getResult(request);

      yield LoginLoaded(response: response);
    } catch (err) {
      print('ERROR IS ====$err');
      yield LoginFailed();
    }
  }
}

import 'dart:async';

import 'package:accoola/repositories/111/repository.dart';
import 'package:accoola/service/models/request.dart';
import 'package:accoola/service/models/resp111.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'bloc111_event.dart';

part 'bloc111_state.dart';

class Bloc111Bloc extends Bloc<Bloc111Event, Bloc111State> {
  Bloc111Bloc({@required this.repository111}) : super(Bloc111Initial());
  final Repository111 repository111;

  @override
  Stream<Bloc111State> mapEventToState(
    Bloc111Event event,
  ) async* {
    if (event is PageOpened) {
      yield* _gettingDataFromBase(event, event.request);
    }
  }

  _gettingDataFromBase(Bloc111Event event, Request request) async* {
    var connectivityResult = await (Connectivity().checkConnectivity());
    bool connected = false;
    if (connectivityResult == ConnectivityResult.mobile) {
      connected = true;
      print('I am connected to a mobile network.');
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connected = true;
      print('I am connected to a wifi network.');
    }
    yield List111Loading();
    try {
      if (connected) {
        //Resp111 resp111 = await repository111.getResult(request);
        //yield List111Loaded(response: resp111);
      }
    } catch (err) {
      yield List111LoadingFailed();
    }
  }
}

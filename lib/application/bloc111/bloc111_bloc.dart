import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc111_event.dart';
part 'bloc111_state.dart';

class Bloc111Bloc extends Bloc<Bloc111Event, Bloc111State> {
  Bloc111Bloc() : super(Bloc111Initial());

  @override
  Stream<Bloc111State> mapEventToState(
    Bloc111Event event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

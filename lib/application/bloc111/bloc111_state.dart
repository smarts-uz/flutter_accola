part of 'bloc111_bloc.dart';

abstract class Bloc111State extends Equatable {
  const Bloc111State();

  @override
  List<Object> get props => [];
}

class Bloc111Initial extends Bloc111State {}

class List111Loading extends Bloc111State {}

class List111Loaded extends Bloc111State {
  final Resp111 response;

  List111Loaded({this.response});
}

class List111LoadingFailed extends Bloc111State {}

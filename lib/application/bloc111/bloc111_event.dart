part of 'bloc111_bloc.dart';

abstract class Bloc111Event extends Equatable {
  const Bloc111Event();

  @override
  List<Object> get props => [];
}

class PageOpened extends Bloc111Event {
  final Request request;

  PageOpened({this.request});
}

class ListLoading extends Bloc111Event {}

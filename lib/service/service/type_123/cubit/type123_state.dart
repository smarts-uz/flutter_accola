part of 'type123_cubit.dart';

@immutable
abstract class TypeState {}

class TypeEmptyState extends TypeState {}

class TypeLoadingState extends TypeState {}

class TypeLoginLoadedState extends TypeState {
  final TypeResponseModel res;

  TypeLoginLoadedState({@required this.res}) : assert(res != null);
}

class TypeErrorState extends TypeState {
  final String message;

  TypeErrorState({this.message});
}

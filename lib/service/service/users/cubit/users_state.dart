part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersEmptyState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoginLoadedState extends UsersState {
  final LoginResponseModel res;

  UsersLoginLoadedState({@required this.res}) : assert(res != null);
}

class UsersErrorState extends UsersState {
  final String message;

  UsersErrorState({this.message});
}

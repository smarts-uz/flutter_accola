import 'package:accoola/service/models/login_request.dart';
import 'package:accoola/service/models/login_response.dart';
import 'package:accoola/service/service/users/users_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository repository = UsersRepository();

  UsersCubit() : super(UsersEmptyState());


  Future<void> login(LoginRequestModel param) async {
    try {
      emit(UsersEmptyState());

      final LoginResponseModel mes = await repository.login(param);

      emit(UsersLoginLoadedState(res: mes));
    } catch (_) {
      emit(UsersErrorState());
    }
  }
}

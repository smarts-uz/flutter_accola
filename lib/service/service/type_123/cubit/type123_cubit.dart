import 'package:accoola/service/models/types/type123_request.dart';
import 'package:accoola/service/models/types/type_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../type_123_repository.dart';

part 'type123_state.dart';

class TypeCubit extends Cubit<TypeState> {
  final Type123Repository repository = Type123Repository();

  TypeCubit() : super(TypeEmptyState());

  Future<void> getData(Type123RequestModel param, String url) async {
    try {
      emit(TypeEmptyState());

      final TypeResponseModel mes = await repository.getData(param, url);

      emit(TypeLoginLoadedState(res: mes));
    } catch (_) {
      emit(TypeErrorState());
    }
  }
}

import 'package:accoola/service/models/types/type_request.dart';
import 'package:accoola/service/models/types/type_response.dart';
import 'package:accoola/service/service/types/type_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'type_state.dart';

class TypeCubit extends Cubit<TypeState> {
  final TypeRepository repository = TypeRepository();

  TypeCubit() : super(TypeEmptyState());


  Future<void> getData(TypeRequestModel param, String url) async {
    try {
      emit(TypeEmptyState());

      final TypeResponseModel mes = await repository.getData(param, url);

      emit(TypeLoginLoadedState(res: mes));
    } catch (_) {
      emit(TypeErrorState());
    }
  }
}

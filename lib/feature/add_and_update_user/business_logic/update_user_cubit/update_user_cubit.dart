import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/model/update_user_model.dart';
import '../../data/repo/user_repo.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.userRepo, this.secureStorage) : super(UpdateUserInitial());

  final UserRepo userRepo;
  final SecureStorage secureStorage;

  Future<void> updateUser({
    required UpdateUserModel updateUserModel,
  }) async {
    emit(UpdateUserLoading());
    try {
      String? token = await secureStorage.readSecureData('token');
      await userRepo.updateUser(
        updateUserModel: updateUserModel,
        token: token!,
      );
      emit(UpdateUserSuccess());
    } catch (e) {
      emit(UpdateUserFailure(e.toString()));
    }
  }
}

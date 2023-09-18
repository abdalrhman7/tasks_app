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
    required String name,
    required String email,
    required String phone,
    required String password,
    //required int departmentId,
    required int userType,
  }) async {
    emit(UpdateUserLoading());
    try {
      String? token = await secureStorage.readSecureData('token');
      await userRepo.updateUser(
        name: name,
        email: email,
        phone: phone,
        password: password,
        userType: userType,
        //departmentId: departmentId,
        token: token,

      );
      emit(UpdateUserSuccess());
    } catch (e) {
      emit(UpdateUserFailure(e.toString()));
    }
  }
}

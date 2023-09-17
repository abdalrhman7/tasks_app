import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/repo/user_repo.dart';

part 'add_new_user_state.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit(this.userRepo, this.secureStorage)
      : super(AddNewUserInitial());

  final UserRepo userRepo;
  final SecureStorage secureStorage;

  Future<void> addNewUser({
    required String name,
    required String email,
    required int userType,
    required String password,
    required String phone,

  }) async {
    emit(AddNewUserLoading());
    try {
      String? token = await secureStorage.readSecureData('token');
      await userRepo.addNewUser(
        name: name,
        email: email,
        userType: userType,
        password: password,
        phone: phone,
        token: token,
      );
      emit(AddNewUserSuccess());
    } catch (e) {
      emit(AddNewUserFailure(e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/model/add_user_model.dart';
import '../../data/model/get_user_model.dart';
import '../../data/repo/user_repo.dart';

part 'add_new_user_state.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit(this.userRepo, this.secureStorage)
      : super(AddNewUserInitial());

  final UserRepo userRepo;
  final SecureStorage secureStorage;

  Future<void> addNewUser({
    required AddUserModel addUserModel,
  }) async {
    emit(AddNewUserLoading());
    try {
      String? token = await secureStorage.readSecureData('token');
      await userRepo.addNewUser(
        addUserModel: addUserModel,
        token: token,
      );
      emit(AddNewUserSuccess());
    } catch (e) {
      emit(AddNewUserFailure(e.toString()));
    }
  }
}

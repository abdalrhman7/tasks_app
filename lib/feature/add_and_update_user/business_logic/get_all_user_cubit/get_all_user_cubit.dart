import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../../deparment/data/model/manger_model.dart';
import '../../../deparment/data/repo/department_repo.dart';
import '../../data/model/get_user_model.dart';
import '../../data/repo/user_repo.dart';

part 'get_all_user_state.dart';

class GetAllUserCubit extends Cubit<GetAllUserState> {
  GetAllUserCubit(this.userRepo, this.secureStorage, this.departmentRepo) : super(GetAllUserInitial());

  final UserRepo userRepo;
  final DepartmentRepo departmentRepo;
  final SecureStorage secureStorage;
  List<GetUserModel> usersList = [];
  List<Manager> mangers = [];

  Future<void> getAllUser() async {
    emit(GetAllUserLoading());
    String? token = await secureStorage.readSecureData('token');
    await userRepo
        .getAllUser(
      token: token,
    )
        .then(
          (value) {
        for (var element in value.data['data']) {
          usersList.add(GetUserModel.fromJson(element));
        }
        emit(GetAllUserSuccess());
      },
    );
    print('${usersList[0].name}++++++++++++++++++++++++++++++++++');
  }

  Future<void> getAllManger() async {
    emit(GetAllUserLoading());
    String? token = await secureStorage.readSecureData('token');
    await departmentRepo
        .getAllManger(
      token: token,
    )
        .then(
          (value) {
        for (var element in value.data['data']) {
          mangers.add(Manager.fromJson(element));
        }
        emit(GetAllUserSuccess());
      },
    );
    print('${mangers[0].name}++++++++++++++++++++++++++++++++++');
  }
}

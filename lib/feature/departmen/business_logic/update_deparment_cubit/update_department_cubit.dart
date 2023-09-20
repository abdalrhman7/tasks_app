import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/model/department_model.dart';
import '../../data/model/manger_model.dart';
import '../../data/repo/department_repo.dart';

part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  UpdateDepartmentCubit(this.departmentRepo, this.secureStorage)
      : super(UpdateDepartmentInitial());

  final DepartmentRepo departmentRepo;
  final SecureStorage secureStorage;

  List<Manager> mangers = [];
  List<DepartmentModel> departments = [];

  Future<void> getAllManger() async {
    emit(UpdateDepartmentLoading());
    String? token = await secureStorage.readSecureData('token');
    await departmentRepo
        .getAllManger(
      token: token!,
    )
        .then(
      (value) {
        for (var element in value.data['data']) {
          mangers.add(Manager.fromJson(element));
        }
        emit(GetAllManagerSuccess());
      },
    );
    print('${mangers[0].name}++++++++++++++++++++++++++++++++++');
  }

  Future<void> updateDepartment({
    required String name,
    required String mangerId,
  }) async {
    String? token = await secureStorage.readSecureData('token');
    departmentRepo.updateDepartment(
      name: name,
      mangerId: mangerId,
      token: token!,
    );
  }
}

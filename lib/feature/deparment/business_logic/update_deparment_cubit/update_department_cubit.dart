import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/feature/deparment/business_logic/new_deparment_cubit/new_department_cubit.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/model/department_model.dart';
import '../../data/model/manger_model.dart';
import '../../data/repo/repo.dart';

part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  UpdateDepartmentCubit(this.departmentRepo, this.secureStorage)
      : super(UpdateDepartmentInitial());

  final DepartmentRepo departmentRepo;
  final SecureStorage secureStorage;

  List<Manager> mangers = [];
  List<Department> departments = [];

  Future<void> getAllManger() async {
    emit(UpdateDepartmentLoading());
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
        emit(GetAllManagerSuccess());
      },
    );
    print('${mangers[0].name}++++++++++++++++++++++++++++++++++');
  }

  Future<void> getAllDepartment() async {
    emit(UpdateDepartmentLoading());
    String? token = await secureStorage.readSecureData('token');
    await departmentRepo
        .getAllDepartments(
      token: token,
    )
        .then(
      (value) {
        for (var element in value.data['data']) {
          departments.add(Department.fromJson(element));
        }
        emit(GetAllManagerSuccess());
      },
    );
  }

  Future<void> updateDepartment({
    required String name,
    required String mangerId,
  }) async {
    String? token = await secureStorage.readSecureData('token');
    departmentRepo.updateDepartment(
      name: name,
      mangerId: mangerId,
      token: token,
    );
  }
}

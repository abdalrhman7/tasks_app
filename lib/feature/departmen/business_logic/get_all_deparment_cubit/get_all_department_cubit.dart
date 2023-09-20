import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/model/department_model.dart';
import '../../data/repo/department_repo.dart';

part 'get_all_department_state.dart';

class GetAllDepartmentCubit extends Cubit<GetAllDepartmentState> {
  GetAllDepartmentCubit(this.departmentRepo, this.secureStorage)
      : super(GetAllDepartmentInitial());

  final DepartmentRepo departmentRepo;
  final SecureStorage secureStorage;
  List<DepartmentModel> departments = [];

  Future<void> getAllDepartment() async {
    emit(GetAllDepartmentLoading());
    String? token = await secureStorage.readSecureData('token');

    try {
      await departmentRepo
          .getAllDepartments(
        token: token!,
      )
          .then(
        (value) {
          for (var element in value.data['data']) {
            departments.add(DepartmentModel.fromJson(element));
          }
          emit(GetAllDepartmentSuccess());
        },
      );
    } catch (e) {
      emit(GetAllDepartmentFailure(e.toString()));
    }
  }
}

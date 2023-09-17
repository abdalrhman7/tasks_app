import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/repo/repo.dart';

part 'new_department_state.dart';

class NewDepartmentCubit extends Cubit<NewDepartmentState> {
  NewDepartmentCubit(this.departmentRepo, this.secureStorage) : super(NewDepartmentInitial());

  final DepartmentRepo departmentRepo;
  final SecureStorage secureStorage;


  Future<void> storeDepartment({required String name}) async {
    emit(NewDepartmentLoading());
    try {
      String? token = await secureStorage.readSecureData('token');
      await departmentRepo.storeDepartment(
        name: name,
        token: token,
      );
      emit(NewDepartmentSuccess());
    } catch (e) {
      emit(NewDepartmentFailure(errMessage: e.toString()));
    }
  }
}

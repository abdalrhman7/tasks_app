import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/feature/add_new_task/data/repo/add_task_repo.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../../add_and_update_user/data/repo/user_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.addTaskRepo, this.secureStorage) : super(AddTaskInitial());

  final AddTaskRepo addTaskRepo;
  final SecureStorage secureStorage;

  Future<void> addTask({
    required String name,
    required String description,
    required String employeeId,
    required String startDate,
    required String endDate,
  }) async {
    emit(AddTaskLoading());
    try {
      String? token = await secureStorage.readSecureData('token');
      await addTaskRepo.addTask(
        name: name,
        description: description,
        employeeId: employeeId,
        startDate: startDate,
        endDate: endDate,
        token: token!,
      );
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}

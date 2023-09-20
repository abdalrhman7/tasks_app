import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/core/utilities/secure_storage.dart';

import '../../data/model/task_model.dart';
import '../../data/repo/get_all_task_repo.dart';

part 'get_all_task_state.dart';

class GetAllTaskCubit extends Cubit<GetAllTaskState> {
  GetAllTaskCubit(this.getAllTaskRepo, this.secureStorage)
      : super(GetAllTaskInitial());
  final GetAllTaskRepo getAllTaskRepo;
  final SecureStorage secureStorage;

  Future<void> getAllTask() async {
    emit(GetAllTaskLoading());
    try {
      final token = await secureStorage.readSecureData('token');
      final tasks = await getAllTaskRepo.getAllTask(token: token!);
      emit(GetAllTaskSuccess(tasks));
    } catch (e) {
      emit(GetAllTaskFailure(e.toString()));
    }
  }
}

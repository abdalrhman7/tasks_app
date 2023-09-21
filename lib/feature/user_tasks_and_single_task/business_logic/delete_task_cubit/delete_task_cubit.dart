import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/secure_storage.dart';
import '../../data/repo/get_and_delete_task_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.getAndDeleteTaskRepo, this.secureStorage)
      : super(DeleteTaskInitial());

  final GetAndDeleteTaskRepo getAndDeleteTaskRepo;
  final SecureStorage secureStorage;

  Future<void> deleteTask({required int taskId}) async {
    try {
      final token = await secureStorage.readSecureData('token');
      getAndDeleteTaskRepo.deleteTask(token: token!, taskId: taskId);
      emit(DeleteTaskSuccess());
    } catch (e) {
      emit(DeleteTaskFailure(e.toString()));
    }
  }
}

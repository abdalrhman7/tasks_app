import 'package:task_app/feature/user_tasks_and_single_task/data/model/task_model.dart';

import '../web_services/get_and_delete_task_web_service.dart';

class GetAndDeleteTaskRepo{
  final GetAndDeleteTaskWebService getAllTaskWebService;

  GetAndDeleteTaskRepo(this.getAllTaskWebService);

  Future<List<TaskModel>> getAllTask({required String token}) async{
    return await getAllTaskWebService.getAllTask(token: token);
  }

  Future<void> deleteTask({required String token, required int taskId}) async {
    getAllTaskWebService.deleteTask(token: token, taskId: taskId);
  }
}
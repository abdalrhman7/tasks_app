import 'package:task_app/feature/user_tasks_and_single_task/data/model/task_model.dart';

import '../web_services/get_all_task_web_service.dart';

class GetAllTaskRepo{
  final GetAllTaskWebService getAllTaskWebService;

  GetAllTaskRepo(this.getAllTaskWebService);

  Future<List<TaskModel>> getAllTask({required String token}) async{
    return await getAllTaskWebService.getAllTask(token: token);
  }
}
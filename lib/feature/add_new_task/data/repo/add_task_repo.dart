
import '../add_task_model/add_task_model.dart';
import '../web_services/add_task_wep_services.dart';

class AddTaskRepo {
  final AddTaskWepServices addTaskWepServices;

  AddTaskRepo(this.addTaskWepServices);

  Future<void> addTask({
    required AddTaskModel addTaskModel,
    required String token,
  }) async {
    addTaskWepServices.addTask(
      addTaskModel: addTaskModel,
      token: token,
    );
  }
}

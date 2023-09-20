
import '../web_services/add_task_wep_services.dart';

class AddTaskRepo {
  final AddTaskWepServices addTaskWepServices;

  AddTaskRepo(this.addTaskWepServices);

  Future<void> addTask({
    required String name,
    required String description,
    required String employeeId,
    required String startDate,
    required String endDate,
    required String token,
  }) async {
    addTaskWepServices.addTask(
      name: name,
      description: description,
      employeeId: employeeId,
      startDate: startDate,
      endDate: endDate,
      token: token,
    );
  }
}

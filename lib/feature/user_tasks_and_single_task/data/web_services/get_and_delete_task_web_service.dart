import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';
import '../model/task_model.dart';

class GetAndDeleteTaskWebService {
  final Dio dio;

  GetAndDeleteTaskWebService(this.dio);

  Future<List<TaskModel>> getAllTask({required String token}) async {
    var response = await dio.get(
      ApiConstants.getAllTask,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    List<TaskModel> tasks = getAllTaskList(response.data);
    print('${tasks[0].name}+++++++++++++++++++++++++++++');

    return tasks;
  }

  Future<void> deleteTask({required String token, required int taskId}) async {
    var response = await dio.delete(
      '${ApiConstants.deleteTask}$taskId',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.data);
  }
}

List<TaskModel> getAllTaskList(Map<String, dynamic> data) {
  List<TaskModel> tasks = [];

  for (var task in data['data']) {
    tasks.add(TaskModel.fromJson(task));
  }
  return tasks;
}

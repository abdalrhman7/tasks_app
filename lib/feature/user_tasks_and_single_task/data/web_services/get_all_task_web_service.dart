import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';
import '../model/task_model.dart';

class GetAllTaskWebService {
  final Dio dio;

  GetAllTaskWebService(this.dio);

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
}

List<TaskModel> getAllTaskList(Map<String, dynamic> data) {
  List<TaskModel> tasks = [];

  for (var task in data['data']) {
    tasks.add(TaskModel.fromJson(task));
  }
  return tasks;
}

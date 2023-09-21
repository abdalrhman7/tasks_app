import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';
import '../add_task_model/add_task_model.dart';

class AddTaskWepServices {
  final Dio dio;

  AddTaskWepServices(this.dio);

  Future<void> addTask({
    required AddTaskModel addTaskModel,
    required String token,
  }) async {
    var response = await dio.post(
      ApiConstants.addTask,
      data: {
        'name': addTaskModel.name,
        'description': addTaskModel.description,
        'status': '0',
        'employee_id': '5',
        'start_date': addTaskModel.startDate,
        'end_date': addTaskModel.endDate,
      },
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

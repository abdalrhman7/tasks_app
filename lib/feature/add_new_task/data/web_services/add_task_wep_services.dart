import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';

class AddTaskWepServices {
  final Dio dio;

  AddTaskWepServices(this.dio);

  Future<void> addTask({
    required String name,
    required String description,
    required String employeeId,
    required String startDate,
    required String endDate,
    required String token,
  }) async {
    var response = await dio.post(
      ApiConstants.addTask,
      data: {
        'name': name,
        'description': description,
        'status': '0',
        'employee_id': '5',
        'start_date': startDate,
        'end_date': endDate,
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

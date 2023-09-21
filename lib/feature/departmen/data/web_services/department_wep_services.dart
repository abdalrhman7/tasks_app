import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';

class DepartmentWebServices {
  final Dio dio;

  DepartmentWebServices(this.dio);

  Future<dynamic> getAllManger({required String token}) async {
    var response = await dio.get(
      ApiConstants.getAllManger,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.data);

    return response;
  }

  Future<void> storeDepartment(
      {required String name, required String token}) async {
    var response = await dio.post(
      ApiConstants.storeDepartment,
      data: {'name': name},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.data);
  }

  Future<void> updateDepartment(
      {required String name,
      required String mangerId,
      required String token}) async {
    var response = await dio.post(
      ApiConstants.updateDepartment,
      data: {'name': name, 'manager_id': mangerId},
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

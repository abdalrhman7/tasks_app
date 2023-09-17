import 'package:dio/dio.dart';
import 'package:task_app/feature/deparment/data/model/manger_model.dart';

import '../../../../core/network/api_constent.dart';

class DepartmentWebServices {
  final Dio dio;

  DepartmentWebServices(this.dio);

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

  Future<dynamic> getAllDepartments({required String token}) async {
    var response = await dio.get(
      ApiConstants.getAllDepartment,
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

  // List<Manger> getMangersList(Map<String, dynamic> data) {
  //   List<Manger> mangers = [];
  //
  //   for (var manger in data['data']) {
  //     mangers.add(Manger.fromJson(manger));
  //   }
  //   return mangers;
  // }
}

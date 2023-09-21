import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';

class HomeScreenWebServices {
  final Dio dio;

  HomeScreenWebServices(this.dio);

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
}

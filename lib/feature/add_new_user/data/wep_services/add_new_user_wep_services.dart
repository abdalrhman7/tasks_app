import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';

class UserWepServices {
  final Dio dio;

  UserWepServices(this.dio);

  Future<void> addNewUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
    required String token,
  }) async {
    var response = await dio.post(
      ApiConstants.addNewUser,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'user_type': userType,
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

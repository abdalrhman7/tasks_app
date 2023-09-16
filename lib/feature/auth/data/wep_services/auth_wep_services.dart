import 'package:dio/dio.dart';


import '../../../../core/network/api_constent.dart';
import '../model/user_model.dart';

class WebServices {
  final Dio dio;

  WebServices(this.dio);

  Future<User> login({required String email, required String password}) async {
    var response = await dio.post(ApiConstants.login,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));
    print(response.data);
    return User.fromJson(response.data['data']);
  }

  Future<void> logout(String? token) async {
    await dio.post(
      ApiConstants.logout,
      data: {'token': token},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}

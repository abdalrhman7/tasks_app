import 'package:dio/dio.dart';

import '../../../../core/network/api_constent.dart';
import '../model/add_user_model.dart';
import '../model/update_user_model.dart';

class UserWepServices {
  final Dio dio;

  UserWepServices(this.dio);

  Future<void> addNewUser({
    required AddUserModel addUserModel,
    required String token,
  }) async {
    var response = await dio.post(
      ApiConstants.addNewUser,
      data: {
        'name': addUserModel.name,
        'email': addUserModel.email,
        'phone': addUserModel.phone,
        'password': addUserModel.password,
        'user_type': addUserModel.userType,
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

  Future<void> updateUser({
    required UpdateUserModel updateUserModel,
    required String token,
  }) async {
    var response = await dio.post(
      ApiConstants.updateUser,
      data: {
        'name': updateUserModel.name,
        'email': updateUserModel.email,
        'phone': updateUserModel.phone,
        'password': updateUserModel.password,
        'user_type': updateUserModel.userType,
        'user_status': 0,
        'department_id': 1,
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

  Future<dynamic> getAllUser({required String token}) async {
    var response = await dio.get(
      ApiConstants.getAllUser,
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

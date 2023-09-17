import 'package:task_app/feature/add_new_user/data/wep_services/add_new_user_wep_services.dart';

class UserRepo {
  final UserWepServices userWepServices;

  UserRepo(this.userWepServices);

  Future<void> addNewUser({
    required String name,
    required String email,
    required int userType,
    required String phone,
    required String password,
    required String token,
  }) async {
    userWepServices.addNewUser(
      name: name,
      email: email,
      userType: userType,
      token: token,
      password: password,
      phone: phone,
    );
  }
}

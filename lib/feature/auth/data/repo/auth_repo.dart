import 'package:task_app/feature/auth/data/model/user_model.dart';
import 'package:task_app/feature/auth/data/wep_services/auth_wep_services.dart';

class AuthRepo {
  final WebServices webServices;

  AuthRepo(this.webServices);

  Future<User> login({required String email, required String password}) async {
   return  await webServices.login(email: email, password: password);
  }

  Future<User> logout(String? token) async {
    return  await webServices.logout(token);
  }
}

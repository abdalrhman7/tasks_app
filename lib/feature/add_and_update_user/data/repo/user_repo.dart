import '../model/add_user_model.dart';
import '../model/update_user_model.dart';
import '../wep_services/add_new_user_wep_services.dart';

class UserRepo {
  final UserWepServices userWepServices;

  UserRepo(this.userWepServices);

  Future<void> addNewUser({
    required AddUserModel addUserModel,
    required String token,
  }) async {
    userWepServices.addNewUser(
      addUserModel: addUserModel,
      token: token,
    );
  }

  Future<dynamic> getAllUser({required String token}) async {
    return await userWepServices.getAllUser(token: token);
  }

  Future<void> updateUser({
    required UpdateUserModel updateUserModel,
    required String token,
  }) async {
    userWepServices.updateUser(
      updateUserModel: updateUserModel,
      token: token,
    );
  }
}

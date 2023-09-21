import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utilities/secure_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo, this.secureStorage, this.sharedPreferences)
      : super(AuthInitial());

  final AuthRepo authRepo;
  final SecureStorage secureStorage;
  final SharedPreferences sharedPreferences;
  var storage = const FlutterSecureStorage();

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      var response = await authRepo.login(
        email: email,
        password: password,
      );
      secureStorage.writeSecureData('token', response.token!);
      sharedPreferences.setString('userType', response.userType!);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    String? token = await secureStorage.readSecureData('token');
    await authRepo.logout(
      token,
    );
    sharedPreferences.remove('userType');
    secureStorage.deleteSecureData('token');
  }

  String getUserType() {
    return sharedPreferences.getString('userType')!;
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;
  var storage = const FlutterSecureStorage();

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      var response = await authRepo.login(
        email: email,
        password: password,
      );
      saveUserToken(response);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    String? token = await storage.read(key: 'token') ;
      await authRepo.logout(
        token ,
      );
      emit(AuthSuccess());
  }


  void saveUserToken(User user) async {
    await storage.write(key: 'token', value: user.token);
  }
}

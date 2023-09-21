import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utilities/secure_storage.dart';
import '../data/model/department_model.dart';
import '../data/home_screen_repo/home_screen_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(this.homeScreenRepo, this.secureStorage) : super(HomeScreenInitial());

  final HomeScreenRepo homeScreenRepo;
  final SecureStorage secureStorage;
  List<DepartmentModel> departments = [];

  Future<void> getAllDepartment() async {
    emit(HomeScreenLoading());
    String? token = await secureStorage.readSecureData('token');

    try {
      await homeScreenRepo
          .getAllDepartments(
        token: token!,
      )
          .then(
            (value) {
          for (var element in value.data['data']) {
            departments.add(DepartmentModel.fromJson(element));
          }
          emit(HomeScreenSuccess());
        },
      );
    } catch (e) {
      emit(HomeScreenFailure(e.toString()));
    }
  }
}

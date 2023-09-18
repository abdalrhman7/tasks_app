import 'package:get_it/get_it.dart';
import 'package:task_app/feature/deparment/business_logic/update_deparment_cubit/update_department_cubit.dart';
import 'package:task_app/feature/deparment/data/repo/department_repo.dart';
import 'package:task_app/feature/deparment/data/web_services/department_wep_services.dart';

import 'core/network/setup_dio.dart';
import 'core/utilities/secure_storage.dart';
import 'feature/add_and_update_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import 'feature/add_and_update_user/business_logic/get_all_user_cubit/get_all_user_cubit.dart';
import 'feature/add_and_update_user/data/repo/user_repo.dart';
import 'feature/add_and_update_user/data/wep_services/add_new_user_wep_services.dart';
import 'feature/auth/business_logic/auth_cubit.dart';
import 'feature/auth/data/repo/auth_repo.dart';
import 'feature/auth/data/wep_services/auth_wep_services.dart';
import 'feature/deparment/business_logic/new_deparment_cubit/new_department_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {

  ///Secure_Storage
  getIt.registerLazySingleton<SecureStorage>(
          () => SecureStorage());

  ///Bloc
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt() , getIt()));
  getIt.registerLazySingleton<UpdateDepartmentCubit>(() => UpdateDepartmentCubit(getIt() , getIt()));
  getIt.registerLazySingleton<NewDepartmentCubit>(() => NewDepartmentCubit(getIt() , getIt()));
  getIt.registerLazySingleton<AddNewUserCubit>(() => AddNewUserCubit(getIt() , getIt()));
  getIt.registerLazySingleton<GetAllUserCubit>(() => GetAllUserCubit(getIt() , getIt() , getIt()));

  ///Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<DepartmentRepo>(() => DepartmentRepo(getIt()));
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(getIt()));

  ///Wep_Services
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));

  getIt.registerLazySingleton<DepartmentWebServices>(
      () => DepartmentWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<UserWepServices>(
      () => UserWepServices(createAndSetupDio()));
}

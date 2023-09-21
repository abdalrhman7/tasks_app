import 'package:get_it/get_it.dart';
import 'package:task_app/feature/home_screen/data/home_screen_repo/home_screen_repo.dart';
import 'package:task_app/feature/home_screen/data/home_screen_web_services/home_screen_web_services.dart';
import 'package:task_app/feature/user_tasks_and_single_task/business_logic/delete_task_cubit/delete_task_cubit.dart';
import 'core/network/setup_dio.dart';
import 'core/utilities/secure_storage.dart';
import 'feature/add_and_update_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import 'feature/add_and_update_user/business_logic/get_all_user_cubit/get_all_user_cubit.dart';
import 'feature/add_and_update_user/data/repo/user_repo.dart';
import 'feature/add_and_update_user/data/wep_services/add_new_user_wep_services.dart';
import 'feature/add_new_task/business_logic/get_all_user_cubit/add_task_cubit.dart';
import 'feature/add_new_task/data/repo/add_task_repo.dart';
import 'feature/add_new_task/data/web_services/add_task_wep_services.dart';
import 'feature/auth/business_logic/auth_cubit.dart';
import 'feature/auth/data/repo/auth_repo.dart';
import 'feature/auth/data/wep_services/auth_wep_services.dart';
import 'feature/departmen/business_logic/new_deparment_cubit/new_department_cubit.dart';
import 'feature/departmen/business_logic/update_deparment_cubit/update_department_cubit.dart';
import 'feature/departmen/data/repo/department_repo.dart';
import 'feature/departmen/data/web_services/department_wep_services.dart';
import 'feature/home_screen/business_logic/home_screen_cubit.dart';
import 'feature/user_tasks_and_single_task/business_logic/get_all_task_cubit/get_all_task_cubit.dart';
import 'feature/user_tasks_and_single_task/data/repo/get_and_delete_task_repo.dart';
import 'feature/user_tasks_and_single_task/data/web_services/get_and_delete_task_web_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void initGetIt() async{
  ///Bloc
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt(), getIt() , getIt()));

  getIt.registerLazySingleton<UpdateDepartmentCubit>(
      () => UpdateDepartmentCubit(getIt(), getIt()));

  getIt.registerLazySingleton<NewDepartmentCubit>(
      () => NewDepartmentCubit(getIt(), getIt()));

  getIt.registerLazySingleton<AddNewUserCubit>(
      () => AddNewUserCubit(getIt(), getIt()));

  getIt.registerLazySingleton<AddTaskCubit>(
      () => AddTaskCubit(getIt(), getIt()));

  getIt.registerLazySingleton<GetAllUserCubit>(
      () => GetAllUserCubit(getIt(), getIt(), getIt()));

  getIt.registerLazySingleton<GetAllTaskCubit>(
      () => GetAllTaskCubit(getIt(), getIt()));

  getIt.registerLazySingleton<HomeScreenCubit>(
      () => HomeScreenCubit(getIt(), getIt()));

  getIt.registerLazySingleton<DeleteTaskCubit>(
      () => DeleteTaskCubit(getIt(), getIt()));

  ///Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<DepartmentRepo>(() => DepartmentRepo(getIt()));
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(getIt()));
  getIt.registerLazySingleton<AddTaskRepo>(() => AddTaskRepo(getIt()));
  getIt.registerLazySingleton<GetAndDeleteTaskRepo>(() => GetAndDeleteTaskRepo(getIt()));
  getIt.registerLazySingleton<HomeScreenRepo>(() => HomeScreenRepo(getIt()));

  ///Wep_Services
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));

  getIt.registerLazySingleton<DepartmentWebServices>(
      () => DepartmentWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<UserWepServices>(
      () => UserWepServices(createAndSetupDio()));

  getIt.registerLazySingleton<AddTaskWepServices>(
      () => AddTaskWepServices(createAndSetupDio()));

  getIt.registerLazySingleton<GetAndDeleteTaskWebService>(
      () => GetAndDeleteTaskWebService(createAndSetupDio()));

  getIt.registerLazySingleton<HomeScreenWebServices>(
      () => HomeScreenWebServices(createAndSetupDio()));


  ///External
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

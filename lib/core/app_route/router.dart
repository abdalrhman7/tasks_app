import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/core/app_route/routes.dart';
import 'package:task_app/feature/add_new_task/data/repo/add_task_repo.dart';

import 'package:task_app/feature/splash_screen/view/screen/splash_screen.dart';
import 'package:task_app/feature/user_tasks_and_single_task/business_logic/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_app/feature/user_tasks_and_single_task/data/repo/get_and_delete_task_repo.dart';

import '../../feature/add_and_update_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import '../../feature/add_and_update_user/business_logic/get_all_user_cubit/get_all_user_cubit.dart';
import '../../feature/add_and_update_user/business_logic/update_user_cubit/update_user_cubit.dart';
import '../../feature/add_and_update_user/data/repo/user_repo.dart';
import '../../feature/add_and_update_user/presentation/view/add_new_user_screen.dart';
import '../../feature/add_and_update_user/presentation/view/update_user_screen.dart';
import '../../feature/add_new_task/business_logic/get_all_user_cubit/add_task_cubit.dart';
import '../../feature/add_new_task/presentation/view/add_new_task_screen.dart';
import '../../feature/auth/presentation/view/auth_screen.dart';
import '../../feature/departmen/business_logic/new_deparment_cubit/new_department_cubit.dart';
import '../../feature/departmen/business_logic/update_deparment_cubit/update_department_cubit.dart';
import '../../feature/departmen/data/repo/department_repo.dart';
import '../../feature/departmen/presentation/view/new_department_screen.dart';
import '../../feature/departmen/presentation/view/update_department_screen.dart';
import '../../feature/home_screen/business_logic/home_screen_cubit.dart';
import '../../feature/home_screen/data/home_screen_repo/home_screen_repo.dart';
import '../../feature/home_screen/presentation/view/home_screen.dart';
import '../../feature/user_tasks_and_single_task/business_logic/get_all_task_cubit/get_all_task_cubit.dart';
import '../../feature/user_tasks_and_single_task/view/screen/single_task_screen.dart';
import '../../feature/user_tasks_and_single_task/view/screen/user_tasks_screen.dart';
import '../../injection.dart';
import '../utilities/secure_storage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authScreen:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );

    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: settings,
      );

    case AppRoutes.departmentScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => NewDepartmentCubit(
              getIt.get<DepartmentRepo>(), getIt.get<SecureStorage>()),
          child: const NewDepartmentScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.updateDepartmentScreen:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<UpdateDepartmentCubit>(
              create: (BuildContext context) => UpdateDepartmentCubit(
                  getIt.get<DepartmentRepo>(), getIt.get<SecureStorage>())
                ..getAllManger(),
            ),
            BlocProvider.value(
              value: BlocProvider.of<HomeScreenCubit>(_),
            ),
          ],
          child: const UpdateDepartmentScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.addNewUserScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => AddNewUserCubit(
              getIt.get<UserRepo>(), getIt.get<SecureStorage>()),
          child: const AddNewUser(),
        ),
        settings: settings,
      );

    case AppRoutes.updateUserScreen:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<GetAllUserCubit>(
              create: (BuildContext context) => GetAllUserCubit(
                  getIt.get<UserRepo>(),
                  getIt.get<SecureStorage>(),
                  getIt.get<DepartmentRepo>())
                ..getAllUser()
                ..getAllManger(),
            ),
            BlocProvider<UpdateUserCubit>(
              create: (BuildContext context) => UpdateUserCubit(
                  getIt.get<UserRepo>(), getIt.get<SecureStorage>()),
            ),
          ],
          child: const UpdateUserScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.addNewTaskScreen:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<GetAllUserCubit>(
              create: (context) => GetAllUserCubit(getIt.get<UserRepo>(),
                  getIt.get<SecureStorage>(), getIt.get<DepartmentRepo>())
                ..getAllUser()
                ..getAllManger(),
            ),
            BlocProvider<AddTaskCubit>(
              create: (context) => AddTaskCubit(
                  getIt.get<AddTaskRepo>(), getIt.get<SecureStorage>()),
            ),
          ],
          child: const AddNewTaskScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.userTaskScreen:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<GetAllTaskCubit>(
              create: (context) => GetAllTaskCubit(
                  getIt.get<GetAndDeleteTaskRepo>(),
                  getIt.get<SecureStorage>()),
            ),
            BlocProvider<DeleteTaskCubit>(
              create: (context) => DeleteTaskCubit(
                getIt.get<GetAndDeleteTaskRepo>(),
                getIt.get<SecureStorage>(),
              ),
            )
          ],
          child: const UserTasksScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.singleTaskScreen:
      final args = settings.arguments as Map<String, dynamic>;
      final taskModel = args['taskModel'];
      return MaterialPageRoute(
        builder: (_) => SingleTaskScreen(taskModel: taskModel),
        settings: settings,
      );


    default:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: settings,
      );
  }
}
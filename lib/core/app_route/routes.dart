import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/feature/deparment/business_logic/new_deparment_cubit/new_department_cubit.dart';
import 'package:task_app/feature/deparment/business_logic/update_deparment_cubit/update_department_cubit.dart';
import 'package:task_app/feature/deparment/presentation/view/new_department_screen.dart';

import '../../feature/add_and_update_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import '../../feature/add_and_update_user/business_logic/get_all_user_cubit/get_all_user_cubit.dart';
import '../../feature/add_and_update_user/business_logic/update_user_cubit/update_user_cubit.dart';
import '../../feature/add_and_update_user/data/repo/user_repo.dart';
import '../../feature/add_and_update_user/presentation/view/add_new_user_screen.dart';
import '../../feature/add_and_update_user/presentation/view/update_user_screen.dart';
import '../../feature/auth/presentation/view/auth_screen.dart';
import '../../feature/deparment/data/repo/department_repo.dart';
import '../../feature/deparment/presentation/view/update_department_screen.dart';
import '../../feature/user_page/view/screen/user-page.dart';
import '../../feature/user_tasks/view/screen/user_tasks_screen.dart';
import '../../injection.dart';
import '../utilities/secure_storage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authScreen:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );

    case AppRoutes.userPage:
      return MaterialPageRoute(
        builder: (_) => const UserPage(),
        settings: settings,
      );

    case AppRoutes.userTaskScreen:
      return MaterialPageRoute(
        builder: (_) => const UserTasksScreen(),
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
        builder: (_) => BlocProvider(
          create: (context) => UpdateDepartmentCubit(
              getIt.get<DepartmentRepo>(), getIt.get<SecureStorage>())
            ..getAllManger()
            ..getAllDepartment(),
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
              create: (BuildContext context) => GetAllUserCubit(getIt.get<UserRepo>(), getIt.get<SecureStorage>() , getIt.get<DepartmentRepo>() )..getAllUser()..getAllManger(),
            ),
            BlocProvider<UpdateUserCubit>(
              create: (BuildContext context) => UpdateUserCubit(getIt.get<UserRepo>(), getIt.get<SecureStorage>()),
            ),
          ],

          child: const UpdateUserScreen(),
        ),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );
  }
}

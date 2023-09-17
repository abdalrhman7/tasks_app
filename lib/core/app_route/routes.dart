import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/feature/add_new_user/data/repo/user_repo.dart';
import 'package:task_app/feature/add_new_user/presentation/view/add_new_user_screen.dart';
import 'package:task_app/feature/add_new_user/presentation/view/update_user_screen.dart';
import 'package:task_app/feature/auth/business_logic/auth_cubit.dart';
import 'package:task_app/feature/deparment/business_logic/new_deparment_cubit/new_department_cubit.dart';
import 'package:task_app/feature/deparment/business_logic/update_deparment_cubit/update_department_cubit.dart';
import 'package:task_app/feature/deparment/presentation/view/new_department_screen.dart';
import 'package:task_app/feature/home_screen/view/screen/HomeScreen.dart';

import '../../feature/add_new_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import '../../feature/auth/data/repo/auth_repo.dart';
import '../../feature/auth/presentation/view/auth_screen.dart';
import '../../feature/deparment/data/repo/repo.dart';
import '../../feature/deparment/presentation/view/update_department_screen.dart';
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
        builder: (_) => const HomeScreen(),
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
          create: (context) => AddNewUserCubit(getIt.get<UserRepo>(), getIt.get<SecureStorage>()),
          child: const AddNewUser(),
        ),
        settings: settings,
      );

    case AppRoutes.updateUserScreen:
      return MaterialPageRoute(
        builder: (_) => const UpdateUserScreen(),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );
  }
}

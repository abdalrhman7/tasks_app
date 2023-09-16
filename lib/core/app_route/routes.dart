import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/feature/auth/business_logic/auth_cubit.dart';
import 'package:task_app/feature/home_screen/view/screen/HomeScreen.dart';

import '../../feature/auth/data/repo/auth_repo.dart';
import '../../feature/auth/presentation/view/auth_screen.dart';
import '../../injection.dart';

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

    default:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );
  }
}

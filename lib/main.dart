import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/feature/departmen/data/repo/department_repo.dart';
import 'package:task_app/feature/home_screen/data/home_screen_repo/home_screen_repo.dart';

import 'core/app_route/routes.dart';
import 'core/theme_data.dart';
import 'core/utilities/secure_storage.dart';
import 'feature/auth/business_logic/auth_cubit.dart';
import 'feature/auth/data/repo/auth_repo.dart';
import 'feature/home_screen/business_logic/home_screen_cubit.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(getIt.get<AuthRepo>(),
                  getIt.get<SecureStorage>(), getIt.get<SharedPreferences>()),
            ),
            BlocProvider<HomeScreenCubit>(
              create: (context) => HomeScreenCubit(
                  getIt.get<HomeScreenRepo>(), getIt.get<SecureStorage>())
                ..getAllDepartment(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            onGenerateRoute: generateRoute,
            //initialRoute: AppRoutes.singleTaskScreen,
          ),
        );
      },
    );
  }
}

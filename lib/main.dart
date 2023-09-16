import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/feature/auth/data/wep_services/auth_wep_services.dart';

import 'core/app_route/routes.dart';
import 'core/theme_data.dart';
import 'feature/auth/business_logic/auth_cubit.dart';
import 'feature/auth/data/repo/auth_repo.dart';
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
        return BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepo>()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}

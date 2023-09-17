import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/app_route/router.dart';


import 'core/app_route/routes.dart';
import 'core/theme_data.dart';
import 'core/utilities/secure_storage.dart';
import 'feature/auth/business_logic/auth_cubit.dart';
import 'feature/auth/data/repo/auth_repo.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  // DepartmentWebServices webServices =  DepartmentWebServices(createAndSetupDio());
  //webServices.storeDepartment(name: , token: token)
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
              create: (context) =>
                  AuthCubit(getIt.get<AuthRepo>(), getIt.get<SecureStorage>()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            onGenerateRoute: generateRoute,
            //initialRoute: AppRoutes.homeScreen,
          ),
        );
      },
    );
  }
}

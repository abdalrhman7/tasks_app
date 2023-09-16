import 'package:get_it/get_it.dart';

import 'core/network/setup_dio.dart';
import 'feature/auth/business_logic/auth_cubit.dart';
import 'feature/auth/data/repo/auth_repo.dart';
import 'feature/auth/data/wep_services/auth_wep_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  ///Bloc
   getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));

  ///Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));

  ///Wep_Services
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

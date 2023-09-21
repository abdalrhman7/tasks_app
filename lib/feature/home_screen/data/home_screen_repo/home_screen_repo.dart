import '../home_screen_web_services/home_screen_web_services.dart';

class HomeScreenRepo {
  final HomeScreenWebServices homeScreenWebServices;

  HomeScreenRepo(this.homeScreenWebServices);

  Future<dynamic> getAllDepartments({required String token}) async {
    return await homeScreenWebServices.getAllDepartments(token: token);
  }
}

import '../web_services/department_wep_services.dart';

class DepartmentRepo {
  final DepartmentWebServices departmentWebServices;

  DepartmentRepo(this.departmentWebServices);

  Future<void> storeDepartment(
      {required String name, required String token}) async {
    departmentWebServices.storeDepartment(name: name, token: token);
  }

  Future<dynamic> getAllManger({required String token}) async {
    return await departmentWebServices.getAllManger(token: token);
  }


  Future<void> updateDepartment(
      {required String name,
      required String mangerId,
      required String token}) async {
    return await departmentWebServices.updateDepartment(
      name: name,
      mangerId: mangerId,
      token: token,
    );
  }
}

import '../../../departmen/data/model/manger_model.dart';

class DepartmentModel {
  int? id;
  String? name;
  Manager? manager;
  List<EmployeeModel>? employees;

  DepartmentModel({this.id, this.name, this.manager, this.employees});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager =
        json['manager'] != null ? Manager.fromJson(json['manager']) : null;
    if (json['employees'] != null) {
      employees = <EmployeeModel>[];
      json['employees'].forEach((v) {
        employees!.add(EmployeeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (manager != null) {
      data['manager'] = manager!.toJson();
    }
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class EmployeeModel {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  EmployeeModel(
      {this.id,
      this.userCode,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.userType,
      this.departmentId});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_code'] = userCode;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['user_type'] = userType;
    data['department_id'] = departmentId;
    return data;
  }
}

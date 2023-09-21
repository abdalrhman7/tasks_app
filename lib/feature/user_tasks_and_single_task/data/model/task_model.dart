import '../../../home_screen/data/model/department_model.dart';
import 'creator.dart';

class TaskModel {
  int? id;
  String? name;
  String? description;
  String? photo;
  String? status;
  String? startDate;
  String? endDate;
  DepartmentModel? department;
  Creator? creator;

  TaskModel({
    this.id,
    this.name,
    this.description,
    this.photo,
    this.status,
    this.startDate,
    this.endDate,
    this.department,
    this.creator,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    status = json['status'];
    startDate = json['start date'];
    endDate = json['end date'];
    department = json['department'] != null
        ? DepartmentModel.fromJson(json['department'])
        : null;
    creator =
    json['creator'] != null ? Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['photo'] = photo;
    data['status'] = status;
    data['start date'] = startDate;
    data['end date'] = endDate;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    return data;
  }
}

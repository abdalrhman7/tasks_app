import 'manger_model.dart';

class Department {
  int? id;
  String? name;
  Manager? manager ;

  Department({
    this.id,
    this.name,

  });

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'];
    manager = json['manager'] != null ? Manager.fromJson(json['manager']) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

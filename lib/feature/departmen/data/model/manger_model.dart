class Manager {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Manager(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Manager.fromJson(Map<String, dynamic> json) {
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
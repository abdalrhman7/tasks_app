class Manager {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  Manager({
    this.id,
    this.userCode,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.userType,
  });

  Manager.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userCode = json['userCode'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['userType'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userCode': userCode,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
      'userType': userType,
    };
  }
}

class User {
  String? token;
  String? username;
  String? email;
  String? userType;

  User({this.token, this.username, this.email, this.userType});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    email = json['email'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    data['email'] = email;
    data['user_type'] = userType;
    return data;
  }
}

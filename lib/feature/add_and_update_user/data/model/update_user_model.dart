class UpdateUserModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final int userType;
  //final int userStatus;

  UpdateUserModel({
    required this.name,
    required this.email,
    required this.userType,
    required this.password,
    required this.phone,
    //required this.userStatus,
  });
}
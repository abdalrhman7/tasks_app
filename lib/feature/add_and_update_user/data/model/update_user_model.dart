class UpdateUserModel {
  final String name;
  final String email;
  final int userType;
  final String password;
  final String phone;
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
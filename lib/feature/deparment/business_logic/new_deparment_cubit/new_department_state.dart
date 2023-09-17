part of 'new_department_cubit.dart';

@immutable
abstract class NewDepartmentState {}

class NewDepartmentInitial extends NewDepartmentState {}

class NewDepartmentLoading extends NewDepartmentState {}

class NewDepartmentSuccess extends NewDepartmentState {}

class NewDepartmentFailure extends NewDepartmentState {
  final String errMessage;

  NewDepartmentFailure({required this.errMessage});
}

// class GetAllMangerSuccess extends NewDepartmentState {
//   final List<Manager> managers;
//
//   GetAllMangerSuccess(this.managers);
// }

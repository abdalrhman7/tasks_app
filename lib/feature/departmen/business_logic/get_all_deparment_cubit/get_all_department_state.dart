part of 'get_all_department_cubit.dart';

@immutable
abstract class GetAllDepartmentState {}

class GetAllDepartmentInitial extends GetAllDepartmentState {}

class GetAllDepartmentLoading extends GetAllDepartmentState {}

class GetAllDepartmentSuccess extends GetAllDepartmentState {}

class GetAllDepartmentFailure extends GetAllDepartmentState {
  final String errMessage;

  GetAllDepartmentFailure(this.errMessage);
}

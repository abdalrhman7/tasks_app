part of 'update_department_cubit.dart';

@immutable
abstract class UpdateDepartmentState {}

class UpdateDepartmentInitial extends UpdateDepartmentState {}

class UpdateDepartmentLoading extends UpdateDepartmentState {}

class UpdateDepartmentSuccess extends UpdateDepartmentState {}

class GetAllManagerSuccess extends UpdateDepartmentState {}

class UpdateDepartmentFailure extends UpdateDepartmentState {}

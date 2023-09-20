part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskFailure extends AddTaskState {
  final String errMessage;
  AddTaskFailure(this.errMessage);
}

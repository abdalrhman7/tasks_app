part of 'get_all_task_cubit.dart';

@immutable
abstract class GetAllTaskState {}

class GetAllTaskInitial extends GetAllTaskState {}

class GetAllTaskLoading extends GetAllTaskState {}

class GetAllTaskSuccess extends GetAllTaskState {
  final List<TaskModel> tasks;

  GetAllTaskSuccess(this.tasks);
}

class GetAllTaskFailure extends GetAllTaskState {
  final String errMessage;

  GetAllTaskFailure(this.errMessage);
}

part of 'delete_task_cubit.dart';

@immutable
abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {}

class DeleteTaskFailure extends DeleteTaskState {
  final String errMessage;

  DeleteTaskFailure(this.errMessage);
}

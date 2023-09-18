part of 'get_all_user_cubit.dart';

@immutable
abstract class GetAllUserState {}

class GetAllUserInitial extends GetAllUserState {}

class GetAllUserLoading extends GetAllUserState {}

class GetAllUserSuccess extends GetAllUserState {}

class GetAllUserFailure extends GetAllUserState {
  final String errMessage;

  GetAllUserFailure(this.errMessage);
}

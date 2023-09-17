part of 'add_new_user_cubit.dart';

@immutable
abstract class AddNewUserState {}

class AddNewUserInitial extends AddNewUserState {}

class AddNewUserLoading extends AddNewUserState {}

class AddNewUserSuccess extends AddNewUserState {}

class AddNewUserFailure extends AddNewUserState {
  final String errMessage;

  AddNewUserFailure(this.errMessage);
}

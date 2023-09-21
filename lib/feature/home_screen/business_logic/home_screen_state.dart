part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}


class HomeScreenLoading extends HomeScreenState {}

class HomeScreenSuccess extends HomeScreenState {}

class HomeScreenFailure extends HomeScreenState {
  final String errMessage;

  HomeScreenFailure(this.errMessage);
}

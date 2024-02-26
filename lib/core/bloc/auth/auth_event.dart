part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckUserAuthEvent extends AuthEvent {}

class LogOutAuthEvent extends AuthEvent {}

class UpdateCurrentIndexEvent extends AuthEvent {
  final int index;
  const UpdateCurrentIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ShowHideBottomBarEvent extends AuthEvent {
  final bool isShow;

  const ShowHideBottomBarEvent(this.isShow);
}

class UpdateBottomNavigationIndex extends AuthEvent {
  final int index;
  const UpdateBottomNavigationIndex(this.index);
}

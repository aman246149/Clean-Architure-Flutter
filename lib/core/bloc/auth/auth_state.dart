part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class ShowHideBottomBarState extends AuthState {
  final bool isShow;
  final DateTime dateTime;
  const ShowHideBottomBarState(this.isShow, this.dateTime);

  @override
  List<Object> get props => [dateTime, isShow];
}

class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState(this.error);
}

class UnAuthenticatedAuthState extends AuthState {}

class UpdatedNavigationState extends AuthState {
  final int index;
  final DateTime dateTime;
  const UpdatedNavigationState(this.index, this.dateTime);

  @override
  List<Object> get props => [dateTime];
}

class AuthSuccessState extends AuthState {}

class OtpSuccessState extends AuthState {}

class RegistrationSuccessState extends AuthState {}

class AuthLoadingState extends AuthState {}

class ForgotPasswordSuccessState extends AuthState{}

class ConfirmPasswordSuccessState extends AuthState{}
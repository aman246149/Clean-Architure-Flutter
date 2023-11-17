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

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String mobileNumber;
  final String password;

  const SignUpEvent(
      {required this.name,
      required this.email,
      required this.mobileNumber,
      required this.password});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;

  const VerifyOtpEvent({required this.otp});
}

class ResendOtpEvent extends AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class UpdateBottomNavigationIndex extends AuthEvent {
  final int index;
  const UpdateBottomNavigationIndex(this.index);
}

class SaveReferIdEvent extends AuthEvent {
  final String referId;

  const SaveReferIdEvent({required this.referId});
}

class GetReferIdEvent extends AuthEvent {
}


class ForgotPasswordEvent extends AuthEvent{
  final String email;

  ForgotPasswordEvent({required this.email});
}

class ConfirmPasswordEvent extends AuthEvent{
  final String email;
  final String password;
  final String code;

  ConfirmPasswordEvent({required this.email, required this.password, required this.code});
}
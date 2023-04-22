part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UpdateCurrentIndexEvent extends AuthEvent {
  final int index;
  const UpdateCurrentIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ShowHideBottamBarEvent extends AuthEvent {
  final bool isShow;

  const ShowHideBottamBarEvent(this.isShow);
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String mobileNumber;
  final String password;

  SignUpEvent(
      {required this.name,
      required this.email,
      required this.mobileNumber,
      required this.password});
}

class GetVerificationCodeEvent extends AuthEvent {
  final String dataForVerification;

  GetVerificationCodeEvent(this.dataForVerification);
}

class VerifyCodeEvent extends AuthEvent {
  final String code;
  final String source;
  final String userName;

  VerifyCodeEvent(
      {required this.code, required this.source, required this.userName});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  ForgotPasswordEvent(this.email);
}

class VerifyNewPasswordEvent extends AuthEvent {
  final String code;
  final String newPassword;

  VerifyNewPasswordEvent({required this.code, required this.newPassword});
}

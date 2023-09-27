part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UpdatedCurrentIndexState extends AuthState {
  final int index;

  const UpdatedCurrentIndexState(this.index);

  @override
  List<Object> get props => [index];
}

class ShowHideBottamBarState extends AuthState {
  final bool isShow;
  final DateTime dateTime;
  const ShowHideBottamBarState(this.isShow, this.dateTime);

  @override
  List<Object> get props => [dateTime, isShow];
}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState(this.error);

}


class VerifyDataLoadingState extends AuthState{}
class VerifyDataSuccessState extends AuthState{}

class VerifyCodeLoadingState extends AuthState{}
class VerifyCodeSuccessState extends AuthState{}

class SignInLoadingState extends AuthState{}
class SignInSuccessState extends AuthState{}

class ForgotPasswordLoadingState extends AuthState{}
class ForgotPasswordSuccessFullState extends AuthState{}

class VerifyNewPasswordLoadingState extends AuthState{}
class VerifyNewPasswordSuccessFullState extends AuthState{}
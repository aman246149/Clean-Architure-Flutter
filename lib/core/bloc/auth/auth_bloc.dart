import 'dart:developer';

import 'package:architecture/core/domain/usecases/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUsecase;
  AuthBloc({required AuthUseCase authUseCase})
      : _authUsecase = authUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<UpdateCurrentIndexEvent>(handleUpdateCurrentIndex);
    on<ShowHideBottamBarEvent>(handleShowHideBottomBar);
    on<SignUpEvent>(handleSignUp);

    on<SignInEvent>(handleSignIn);

  }

  void handleUpdateCurrentIndex(
      UpdateCurrentIndexEvent event, Emitter<AuthState> emit) {
    emit(UpdatedCurrentIndexState(event.index));
  }

  void handleShowHideBottomBar(
      ShowHideBottamBarEvent event, Emitter<AuthState> emit) {
    emit(ShowHideBottamBarState(event.isShow, DateTime.now()));
  }

  void handleSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignUpLoadingState());
      await _authUsecase.handleSignUp({
        "name": event.name,
        "email": event.email,
        "mobile_number": event.mobileNumber,
        "password": event.password
      });
      emit(SignUpSuccessState());
    } catch (e) {
      log("Error", error: e.toString());
      emit(AuthErrorState(e.toString()));
    }
  }




  void handleSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignInLoadingState());
      await _authUsecase
          .handleSignIn({"email": event.email, "password": event.password});
      emit(SignInSuccessState());
    } catch (e) {
      log("Error", error: e.toString());
      emit(AuthErrorState(e.toString()));
    }
  }



}

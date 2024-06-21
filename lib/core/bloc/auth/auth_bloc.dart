

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUsecase;
  String? email;
  String? password;
  String? referId;
  AuthBloc({required AuthUseCase authUseCase})
      : _authUsecase = authUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<CheckUserAuthEvent>(handleCheckUserAuthState);
    on<ShowHideBottomBarEvent>(handleShowHideBottomBar);

  }

  void handleUpdateBottomNavigationIndex(
      UpdateBottomNavigationIndex event, Emitter<AuthState> emit) async {
    emit(UpdatedNavigationState(event.index, DateTime.now()));
  }



  void handleCheckUserAuthState(
      CheckUserAuthEvent event, Emitter<AuthState> emit) async {
    try {
      var result = await _authUsecase.handleCheckUserAuthState();
      if (result) {
        emit(AuthSuccessState());
      } else {
        emit(UnAuthenticatedAuthState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void handleShowHideBottomBar(
      ShowHideBottomBarEvent event, Emitter<AuthState> emit) {
    emit(ShowHideBottomBarState(event.isShow, DateTime.now()));
  }

  
}

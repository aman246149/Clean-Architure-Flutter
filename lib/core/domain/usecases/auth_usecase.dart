import 'dart:developer';

import 'package:architecture/core/data/repository/auth_repository.dart';
import 'package:architecture/core/data/repository/db_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthUseCase {
  final AuthRepository _authRepository;
  final DatabaseRepository _databaseRepository;

  AuthUseCase(this._authRepository, this._databaseRepository);

  Future<bool> handleCheckUserAuthState() async {
    try {
      var data = await _databaseRepository.getTokenValues();
      if (data == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleSignOut() async {
    try {
      log("Going for sign out");
      await _authRepository.signOut();
      log("Amplify Signed Out");
      await _databaseRepository.removeTokenValues();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleSignUp(Map data) async {
    try {
      await _authRepository.signUp(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> handleSignIn(Map data) async {
    try {
      var token = await _authRepository.signIn(data);
      if (token.isEmpty) {
        return false;
      }
      await _databaseRepository.setTokenValues(authToken: token);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleSignInWithGoogle() async {
    try {
      var token = await _authRepository.signInWithGoogle();
      await _databaseRepository.setTokenValues(authToken: token ?? "");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleConfirmSignUp(Map data) async {
    try {
      var token = await _authRepository.confirmUserCode(data);
      await _databaseRepository.setTokenValues(authToken: token);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleResendCode(String email) async {
    try {
      await _authRepository.resendOtp(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleSaveReferId(String referId) async {
    try {
      await _databaseRepository.setReferId(referId: referId);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetReferId() async {
    try {
      Map<String, dynamic>? data = await _databaseRepository.getReferId();
      return data?["referId"];
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> handleForgotPassword(String email) async {
    try {
    return  await _authRepository.forgortPassword(email);
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> handleConfirmPassword(Map data) async {
    try {
    return  await _authRepository.confirmPassword(data);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:architecture/core/data/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthUseCase {
   final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);
  Future<dynamic> handleSignUp(Map data) async {
    try {
      return await _authRepository.signUp(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleSignIn(Map data) async {
    try {
      return await _authRepository.signIn(data);
    } catch (e) {
      rethrow;
    }
  }
 
}

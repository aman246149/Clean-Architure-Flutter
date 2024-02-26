
import 'package:injectable/injectable.dart';

import '../../data/repository/auth_repository.dart';
import '../../data/repository/db_repository.dart';

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

  
}

import 'package:architecture/core/constants/app_constants.dart';
import 'package:architecture/core/data/db/db_client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DatabaseRepository {
  final DBClient _dbClient;

  DatabaseRepository(this._dbClient);

  Future<dynamic> setTokenValues({required String authToken}) async {
    try {
      return await _dbClient.setDocument(
          colectionName: "auth",
          documentName: "tokenData",
          data: {AppConstants.token: authToken});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getTokenValues() async {
    try {
      return await _dbClient.getDocument(
          colectionName: "auth", documentName: "tokenData");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeTokenValues() async {
    try {
      await _dbClient.deleteDocument(
          colectionName: "auth", documentName: "tokenData");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> setReferId({required String referId}) async {
    try {
      return await _dbClient.setDocument(
          colectionName: "referId",
          documentName: "referId",
          data: {"referId": referId});
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteReferId() async {
    try {
      await _dbClient.deleteDocument(
          colectionName: "referId", documentName: "referId");
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getReferId() async {
    try {
      return await _dbClient.getDocument(
          colectionName: "referId", documentName: "referId");
    } catch (e) {
      rethrow;
    }
  }
}

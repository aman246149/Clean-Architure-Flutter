import 'package:architecture/core/data/network/api_client.dart';
import 'package:architecture/core/data/network/endpoints.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InternShipRepository {
  InternShipRepository(this._apiClient);
  final ApiClient _apiClient;

  Future<dynamic> getInterships(Map<String, dynamic> map) async {
    try {
      return _apiClient.get(Endpoints.interships, queryParameters: map);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getIntershipById(String id) async {
    try {
      return _apiClient.get("${Endpoints.interships}/$id");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getMyApplications() async {
    try {
      return _apiClient.get("${Endpoints.interships}/applications/me");
    } catch (e) {
      rethrow;
    }
  }
  // Future<dynamic> getAllIntershipApplication(String id) async {
  //   try {
  //     return _apiClient.get("${Endpoints.interships}/$id/applications");
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<dynamic> applyInternShip(String id,Map data) async {
    try {
      return _apiClient.post("${Endpoints.interships}/$id/applications/me",data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> checkInternShip(String id) async {
    try {
      return _apiClient.get("${Endpoints.interships}/$id/applications/check");
    } catch (e) {
      rethrow;
    }
  }
}

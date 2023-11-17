import 'package:architecture/core/data/network/endpoints.dart';
import 'package:injectable/injectable.dart';

import '../network/api_client.dart';

@lazySingleton
class SearchRepository {
   final ApiClient _apiClient;
  SearchRepository(this._apiClient);

    Future<dynamic> search(Map<String,dynamic> query) async {
    try {
      return _apiClient.get(Endpoints.home,queryParameters: query);
    } catch (e) {
      rethrow;
    }
  }

}

import 'package:architecture/core/data/network/api_client.dart';
import 'package:injectable/injectable.dart';

import '../network/endpoints.dart';

@lazySingleton
class EventRepository {
  final ApiClient _apiClient;

  EventRepository(this._apiClient);

  Future<dynamic> getAllEvents(Map<String, dynamic> data) async {
    try {
      return _apiClient.get(Endpoints.events, queryParameters: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getEventsById(String id) async {
    try {
      return _apiClient.get("${Endpoints.events}/$id");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getMyBookings() async {
    try {
      return _apiClient.get("${Endpoints.events}/bookings/me");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createEventBooking(String id, Map data) async {
    try {
      return _apiClient.post("${Endpoints.events}/$id/bookings/me", data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getRzpDetails(String id, num amount) async {
    try {
      return _apiClient
          .get("${Endpoints.events}/$id/bookings/me?amount=$amount");
    } catch (e) {
      rethrow;
    }
  }
}

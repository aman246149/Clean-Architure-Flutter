import 'package:architecture/core/data/network/api_client.dart';
import 'package:architecture/core/data/network/endpoints.dart';
import 'package:architecture/core/data/repository/db_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@lazySingleton
class ProfileRepository {
  ProfileRepository(this._apiClient,this._databaseRepository);
  final ApiClient _apiClient;
  final DatabaseRepository _databaseRepository;

  Future<dynamic> getMyProfile() async {
    try {
      return _apiClient.get(Endpoints.profile);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getBookmarks(String type) async {
    try {
      return _apiClient.get("${Endpoints.bookmarks}?type=$type");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateSkill(Map data) async {
    try {
      return _apiClient.put(Endpoints.skills, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addEducationalDetails(Map data) async {
    try {
      return _apiClient.post(Endpoints.education, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateEducationalDetails(Map data, String id) async {
    try {
      return _apiClient.patch("${Endpoints.education}/$id", data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addToBookmark(Map data) async {
    try {
      return _apiClient.post(Endpoints.bookmarks, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addExperienceDetails(Map data) async {
    try {
      return _apiClient.post(Endpoints.experience, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateExperienceDetails(Map data, String id) async {
    try {
      return _apiClient.patch("${Endpoints.experience}/$id", data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateMyProfile(FormData data) async {
    try {
      return _apiClient.patch(Endpoints.profile, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAllSkills() async {
    try {
      return _apiClient.get(Endpoints.allSkills);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getLeaderBoard() async {
    try {
      return _apiClient.get("/users/leaderboard");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getStCoinsTransactionHistory() async {
    try {
      return _apiClient.get('${Endpoints.profile}/stcoins?sort=-createdAt');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> buyStCoins(Map data) async {
    try {
      return _apiClient.post("/users/me/stcoins", data: data);
    } catch (e) {
      rethrow;
    }
  }


  Future<dynamic> addReferal(Map data) async {
    try {
       _databaseRepository.deleteReferId();
      return  _apiClient.post("/users/${data["userId"]}/referrals");

    } catch (e) {
      rethrow;
    }
  }
}

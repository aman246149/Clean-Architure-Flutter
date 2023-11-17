import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/profile_repository.dart';

@lazySingleton
class ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<dynamic> handleGetAllSkills() async {
    try {
      return await _profileRepository.getAllSkills();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetMyProfile() async {
    try {
      return await _profileRepository.getMyProfile();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetBookmarks(String type) async {
    try {
      return await _profileRepository.getBookmarks(type);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleUpdateSkill(Map data) async {
    try {
      return await _profileRepository.updateSkill(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleAddEducationalDetails(Map data) async {
    try {
      return await _profileRepository.addEducationalDetails(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleUpdateEducationalDetails(Map data, String id) async {
    try {
      return await _profileRepository.updateEducationalDetails(data, id);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleAddExperienceDetails(Map data) async {
    try {
      return await _profileRepository.addExperienceDetails(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleAddToBookmark(Map data) async {
    try {
      return await _profileRepository.addToBookmark(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleUpdateExperienceDetails(Map data, String id) async {
    try {
      return await _profileRepository.updateExperienceDetails(data, id);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleUpdateMyProfile(FormData data) async {
    try {
      return await _profileRepository.updateMyProfile(data);
    } catch (e) {
      rethrow;
    }
  }

    Future<dynamic> handleGetLeaderBoard() async {
    try {
      return await _profileRepository.getLeaderBoard();
    } catch (e) {
      rethrow;
    }
  }

    Future<dynamic> handleStCoinsTransactionHistory() async {
    try {
      return await _profileRepository.getStCoinsTransactionHistory();
    } catch (e) {
      rethrow;
    }
  }
    Future<dynamic> handleBuyStCoins(Map data) async {
    try {
      return await _profileRepository.buyStCoins(data);
    } catch (e) {
      rethrow;
    }
  }
  
    Future<dynamic> handleAddReferal(Map data) async {
    try {
      return await _profileRepository.addReferal(data);
    } catch (e) {
      rethrow;
    }
  }

}

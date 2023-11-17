
import 'package:architecture/core/data/repository/intership_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InternShipUseCase {
  final InternShipRepository _internShipRepository;


  InternShipUseCase(this._internShipRepository);



  Future<dynamic> handleGetInterships(Map<String,dynamic> data) async {
    try {
    return  await _internShipRepository.getInterships(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetIntershipById(String id) async {
    try {
    return  await _internShipRepository.getIntershipById(id);
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> handleGetMyApplications() async {
    try {
    return  await _internShipRepository.getMyApplications();
    } catch (e) {
      rethrow;
    }
  }
  // Future<dynamic> handleGetAllInternshipsApplications(String id) async {
  //   try {
  //    return await _internShipRepository.getAllIntershipApplication(id);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
    Future<dynamic> handleApplyInternship(String id,Map data) async {
    try {
    return  await _internShipRepository.applyInternShip(id,data);
    } catch (e) {
      rethrow;
    }
  }
 
    Future<dynamic> handleCheckInternship(String id) async {
    try {
    return  await _internShipRepository.checkInternShip(id);
    } catch (e) {
      rethrow;
    }
  }
 
}

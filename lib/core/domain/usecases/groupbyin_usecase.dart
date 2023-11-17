import 'package:architecture/core/data/repository/groupbyin_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GroupByInUseCase {
  final GroupByInRepository _groupByInRepository;

  GroupByInUseCase(this._groupByInRepository);

  Future<dynamic> handleGetAllGroupByIns() async {
    try {
      return await _groupByInRepository.getAllGroupByIns();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetGroupByInById(String id) async {
    try {
      return await _groupByInRepository.getGroupByInById(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGroupBuyInBooking(String id, Map data) async {
    try {
      return await _groupByInRepository.createGroupBuyInBooking(id, data);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:architecture/core/data/repository/search_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class SearchUseCase {
  final SearchRepository _searchRepository;

  SearchUseCase(this._searchRepository);


    Future<dynamic> handleSearch(Map<String,dynamic>map) async {
    try {
      return await _searchRepository.search(map);
    } catch (e) {
      rethrow;
    }
  }
}

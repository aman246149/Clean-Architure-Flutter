import 'package:architecture/core/data/network/api_client.dart';
import 'package:architecture/core/data/network/endpoints.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ArticleRepository {
  final ApiClient _apiClient;
  ArticleRepository(this._apiClient);

  Future<List<dynamic>> getAllArticles(Map<String,dynamic> query) async {
    try {
      var res = await _apiClient.get(Endpoints.articles,queryParameters: query);
      print(res["data"]["data"]);
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getArticleById(String id) async {
    try {
      var res = await _apiClient.get("${Endpoints.articles}/$id");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getMyArticles(String status) async {
    try {
      var res = await _apiClient.get("${Endpoints.myArticles}?status=$status");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createArticle(Map<String, dynamic> data) async {
    try {
      var res = await _apiClient.post(Endpoints.articles, data: data);
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateArticle(Map<String, dynamic> data) async {
    try {
      var res = await _apiClient.patch("${Endpoints.articles}/${data['id']}",
          data: data);
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteArticle(String id) async {
    try {
      await _apiClient.delete("${Endpoints.articles}/$id");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createComment(String id, Map<String, dynamic> data) async {
    try {
      var res = await _apiClient
          .post("${Endpoints.articles}/$id${Endpoints.comments}", data: data);
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAllArticleComments(String id) async {
    try {
      var res = await _apiClient
          .get("${Endpoints.articles}/$id${Endpoints.comments}");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> likeArticle(String id, String commentId) async {
    try {
      var res = await _apiClient.post(
          "${Endpoints.articles}/$id${Endpoints.comments}/$commentId${Endpoints.likes}");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> likeArticleById(String id) async {
    try {
      var res =
          await _apiClient.post("${Endpoints.articles}/$id${Endpoints.likes}");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteLikeArticleById(String id) async {
    try {
      var res = await _apiClient
          .delete("${Endpoints.articles}/$id${Endpoints.likes}");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> removeLikeArticle(String id, String commentId) async {
    try {
      var res = await _apiClient.delete(
          "${Endpoints.articles}/$id${Endpoints.comments}/$commentId${Endpoints.likes}");
      return res["data"]["data"];
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:architecture/core/data/repository/article_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ArticleUseCase {
  final ArticleRepository _articleRepository;

  ArticleUseCase(this._articleRepository);

  Future<List<dynamic>> handleGetAllArticles(Map<String,dynamic> query) async {
    try {
      return await _articleRepository.getAllArticles(query);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getMyArticles(String status) async {
    try {
      return await _articleRepository.getMyArticles(status);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetOneArticle(String id) async {
    try {
      return await _articleRepository.getArticleById(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleCreateArticle(Map<String, dynamic> data) async {
    try {
      await _articleRepository.createArticle(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleUpdateArticle(Map<String, dynamic> data) async {
    try {
      await _articleRepository.updateArticle(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleCreateComment(
      String articleId, Map<String, dynamic> data) async {
    try {
      await _articleRepository.createComment(articleId, data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleGetArticleComments(String articleId) async {
    try {
      return await _articleRepository.getAllArticleComments(articleId);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleLikeArticleComment(
      String articleId, String commentId) async {
    try {
      await _articleRepository.likeArticle(articleId, commentId);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleRemoveLikeArticleComment(
      String articleId, String commentId) async {
    try {
      await _articleRepository.removeLikeArticle(articleId, commentId);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleLikeArticleById(String articleId) async {
    try {
      await _articleRepository.likeArticleById(articleId);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleRemoveLikeArticleById(String articleId) async {
    try {
      await _articleRepository.deleteLikeArticleById(articleId);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleDeleteArticleById(String articleId) async {
    try {
      await _articleRepository.deleteArticle(articleId);
    } catch (e) {
      rethrow;
    }
  }
}

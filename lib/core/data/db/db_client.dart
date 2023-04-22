import 'package:localstore/localstore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DBClient {
  final Localstore _localstore;

  DBClient(this._localstore);

  Future<Map<String, dynamic>?> getDocument(
      {required String colectionName, required String documentName}) async {
    return await _localstore.collection(colectionName).doc(documentName).get();
  }

  Stream<Map<String, dynamic>> getCollectionStream(
      {required String colectionName}) {
    return _localstore.collection(colectionName).stream;
  }

  Future<void> setDocument(
      {required String colectionName,
      required String documentName,
      required Map<String, dynamic> data}) async {
    return await _localstore
        .collection(colectionName)
        .doc(documentName)
        .set(data);
  }

  Future<void> deleteDocument(
      {required String colectionName, required String documentName}) async {
    return await _localstore
        .collection(colectionName)
        .doc(documentName)
        .delete();
  }
}

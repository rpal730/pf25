import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCollectionData(
    String collectionPath,
  ) async {
    try {
      final querySnapshot = await _firestore.collection(collectionPath).get();
      for (var doc in querySnapshot.docs) {
        print('"${doc.id}": ${doc.data()},');
      }

      return querySnapshot.docs.map((doc) {
        final data = doc.data();

        return data;
      }).toList();
    } catch (e) {
      print('Error fetching collection: $e');
      return [];
    }
  }

  //- for new document
  Future<void> createDocument({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionName).add(data);
    } catch (e) {
      rethrow;
    }
  }

  //- Fetch a document by ID from a collection.
  Future<Map<String, dynamic>?> getDocument({
    required String collectionName,
    required String documentId,
  }) async {
    try {
      final docSnapshot =
          await _firestore.collection(collectionName).doc(documentId).get();

      return docSnapshot.exists ? docSnapshot.data() : null;
    } catch (e) {
      rethrow;
    }
  }

  ///- Fetch all documents in a collection. do not use this for big collections having thousands of documents(USE PAGINATION INSTEAD)
  Future<List<Map<String, dynamic>>> getAllDocuments({
    required String collectionName,
  }) async {
    try {
      final querySnapshot = await _firestore.collection(collectionName).get();

      return querySnapshot.docs
          .map((doc) => {"id": doc.id, ...doc.data()})
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// - Update a document by ID with new [data].
  Future<void> updateDocument({
    required String collectionName,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(documentId).update(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DocumentSnapshot>> getDocumentsWithPagination({
    required String collectionName,
    DocumentSnapshot? startAfter,
    int limit = 10,
  }) async {
    try {
      Query query = _firestore.collection(collectionName).limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final querySnapshot = await query.get();

      return querySnapshot.docs;
    } catch (e) {
      rethrow;
    }
  }

  // FirestoreService
  Future<void> setDocument({
    required String collectionName,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    final parts = collectionName.split('/');
    CollectionReference ref = FirebaseFirestore.instance.collection(parts[0]);
    for (int i = 1; i < parts.length; i += 2) {
      final doc = parts[i];
      final subCollection = parts[i + 1];
      ref = ref.doc(doc).collection(subCollection);
    }
    await ref.doc(docId).set(data);
  }

  Future<void> deleteDocument({
    required String collectionName,
    required String docId,
  }) async {
    final parts = collectionName.split('/');
    CollectionReference ref = FirebaseFirestore.instance.collection(parts[0]);
    for (int i = 1; i < parts.length; i += 2) {
      final doc = parts[i];
      final subCollection = parts[i + 1];
      ref = ref.doc(doc).collection(subCollection);
    }
    await ref.doc(docId).delete();
  }
}

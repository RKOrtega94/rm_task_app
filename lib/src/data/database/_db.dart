import 'package:cloud_firestore/cloud_firestore.dart';

/// DatabaseQuery
///
/// This class is used to query the database for data
class DatabaseQuery {
  /// Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Get collection
  Future<Map> getCollection(String collection) async {
    QuerySnapshot querySnapshot = await firestore.collection(collection).get();
    return querySnapshot.docs.asMap();
  }

  /// Get a single document
  Future<Map> getCollectionWhere(
      String collection, String field, String value) async {
    QuerySnapshot querySnapshot = await firestore
        .collection(collection)
        .where(field, isEqualTo: value)
        .get();
    return querySnapshot.docs.asMap();
  }

  // Store data
  Future<Map?> storeData(String collection, Map<String, dynamic> data) async {
    DocumentReference documentReference =
        await firestore.collection(collection).add(data);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Object? document = documentSnapshot.data();
    return document as Map?;
  }

  // Update data
  Future<Map?> updateData(
      String collection, String documentId, Map<String, dynamic> data) async {
    DocumentReference documentReference =
        firestore.collection(collection).doc(documentId);
    await documentReference.update(data);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Object? document = documentSnapshot.data();
    return document as Map?;
  }

  // Delete data
  Future<Map?> deleteData(String collection, String documentId) async {
    DocumentReference documentReference =
        firestore.collection(collection).doc(documentId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Object? document = documentSnapshot.data();
    await documentReference.delete();
    return document as Map?;
  }
}

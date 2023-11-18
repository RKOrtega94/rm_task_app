import 'package:cloud_firestore/cloud_firestore.dart';

/// DatabaseQuery
///
/// This class is used to query the database for data
class DatabaseQuery {
  /// Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Get collection
  Future<List<Map>> getCollection(String collection) async {
    QuerySnapshot querySnapshot = await firestore.collection(collection).get();
    return querySnapshot.docs.map((e) => e.data() as Map).toList();
  }

  /// Get a single document
  Future<List<Map>> getCollectionWhere(
      String collection, String field, String value) async {
    QuerySnapshot querySnapshot = await firestore
        .collection(collection)
        .where(field, isEqualTo: value)
        .get();
    return querySnapshot.docs.map((e) => e.data() as Map).toList();
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
  Future<void> deleteData(String collection, String documentId) async {
    // first get the document by id
    QuerySnapshot querySnapshot = await firestore
        .collection(collection)
        .where('id', isEqualTo: documentId)
        .get();

    // get document reference
    DocumentReference documentReference =
        firestore.collection(collection).doc(querySnapshot.docs.first.id);

    // delete document
    await documentReference.delete();
  }
}

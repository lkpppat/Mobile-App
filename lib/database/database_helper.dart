import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

class DatabaseHelper {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection(Pets.collectionName);
  // insert
  Future<DocumentReference> insertPets(Pets pets) {
    return collection.add(pets.toJson());
  }

  // update
  void updatePets(Pets pets) async {
    await collection.doc(pets.referenceId).update(pets.toJson());
  }

  // delete
  void deletePets(Pets pets) async {
    await collection.doc(pets.referenceId).delete();
  }

  // get  all dociments from collection
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

}

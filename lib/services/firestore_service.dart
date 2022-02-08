import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_ver3/model/vehiclemodel.dart';

class FirestoreService {
// Create a CollectionReference called bookCollection that references
// the firestore collection
  final CollectionReference vehicleCollection =
      FirebaseFirestore.instance.collection('vehicles');
  Future<void> addVehicleData(
      String vehicleNo, String vehicleModel, String regDate) async {
    var docRef = FirestoreService().vehicleCollection.doc();
    print('add docRef: ' + docRef.id);
    await vehicleCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'vehicleNo': vehicleNo,
      'vehicleModel': vehicleModel,
      'regDate': regDate
    });
  } //addBookData

  Future<List<VehicleModel>> readVehicleData() async {
    List<VehicleModel> vehicleList = [];
    QuerySnapshot snapshot = await vehicleCollection.get();
    snapshot.docs.forEach((document) {
      VehicleModel vehicleModel = VehicleModel.fromMap(document.data());
      vehicleList.add(vehicleModel);
    });
    print('Booklist: $vehicleList');
    return vehicleList;
  } //readBookData

  Future<void> deleteVehicleData(String docId) async {
    vehicleCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteBookData

//for your reference
  Future<void> deleteVehicleDoc() async {
    await vehicleCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //FirestoreService

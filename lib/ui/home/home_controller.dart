import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // ONE TIME READ - use .get()
  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference products = firestore.collection('products');
  //   return products.get();
  // }

  // REALTIME READ - use .snapshot()
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection('products');

    return products.orderBy("date", descending: true).snapshots();
  }

  // Delete documents in product collection
  void deleteDocs(String docID) {
    DocumentReference productID = firestore.collection('products').doc(docID);
    productID.delete();
  }
}

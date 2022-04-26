import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController priceController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference productID = firestore.collection('products').doc(docID);
    return productID.get();
  }

  void editProduct(String name, String price, String docID) async {
    DocumentReference products = firestore.collection('products').doc(docID);

    int parsePrice = int.parse(price);

    try {
      await products.update({
        'name': name,
        'price': parsePrice,
      });
      Get.snackbar('Success', 'You have success add data into firestore',
          snackPosition: SnackPosition.BOTTOM);

      nameController.clear();
      priceController.clear();

      Get.offAllNamed('/');
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.message!);
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }
}

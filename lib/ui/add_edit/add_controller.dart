import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController priceController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProducts(String name, String price) async {
    int parsePrice = int.parse(price);

    try {
      CollectionReference products = firestore.collection('products');

      String date = DateTime.now().toIso8601String();
      await products.add({
        'name': name,
        'price': parsePrice,
        'date': date,
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

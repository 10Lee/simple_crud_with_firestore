import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_cloud_firestore_getx/ui/add_edit/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Edit extends GetWidget<EditController> {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Data')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> snapshotData =
                  snapshot.data!.data() as Map<String, dynamic>;

              controller.nameController.text = snapshotData['name'];
              controller.priceController.text =
                  snapshotData['price'].toString();

              return Column(
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: controller.priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () => controller.editProduct(
                          controller.nameController.text,
                          controller.priceController.text,
                          Get.arguments),
                      child: Text("Update"))
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

import 'package:crud_cloud_firestore_getx/ui/add_edit/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Add extends GetWidget<AddController> {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Data')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: controller.priceController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text("Price"),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                controller.addProducts(controller.nameController.text,
                    controller.priceController.text);
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_cloud_firestore_getx/ui/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/add"),
        child: Icon(Icons.add),
      ),

      // ONE TIME READ - products.get() ON home_controller.dart
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var docs = snapshot.data!.docs;

      //       return ListView.builder(
      //         itemCount: docs.length,
      //         itemBuilder: (context, index) {
      //           Map<String, dynamic> data =
      //               docs[index].data() as Map<String, dynamic>;

      //           return InkWell(
      //             onTap: () => Get.toNamed('/edit'),
      //             child: ListTile(
      //               contentPadding: const EdgeInsets.all(30.0),
      //               title: Text("${data['name']}"),
      //               subtitle: Text("Rp. ${data['price']}"),
      //               trailing: IconButton(
      //                 onPressed: () {},
      //                 icon: Icon(Icons.delete),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      // ),

      // REALTIME READ - products.snapshot() ON home_controller.dart
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var docs = snapshot.data!.docs;

            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      docs[index].data() as Map<String, dynamic>;

                  return InkWell(
                    onTap: () => Get.toNamed(
                      '/edit',
                      arguments: docs[index].id,
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(30.0),
                      title: Text("${data['name']}"),
                      subtitle: Text("Rp. ${data['price']}"),
                      trailing: IconButton(
                        onPressed: () => controller.deleteDocs(docs[index].id),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}

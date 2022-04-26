import 'package:crud_cloud_firestore_getx/ui/add_edit/add_controller.dart';
import 'package:get/get.dart';

import 'edit_controller.dart';

class AddEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
    Get.lazyPut(() => EditController());
  }
}

import 'package:crud_cloud_firestore_getx/ui/detail/detail_controller.dart';
import 'package:get/instance_manager.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}

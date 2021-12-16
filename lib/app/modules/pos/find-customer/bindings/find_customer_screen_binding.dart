import 'package:get/get.dart';

import '../controllers/find_customer_controller.dart';

class FindCustomerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindCustomerScreenController>(
      () => FindCustomerScreenController(),
    );
  }
}

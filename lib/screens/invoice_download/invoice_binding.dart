import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'invoice_controller.dart';


class MyInvoiceViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyInvoiceViewController>(
          () => MyInvoiceViewController(),
    );
  }
}
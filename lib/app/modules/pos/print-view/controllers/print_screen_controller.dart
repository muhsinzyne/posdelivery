import 'package:get/get.dart';
import 'package:posdelivery/app/modules/pos/print-view/contracts.dart';
import 'package:posdelivery/controllers/base_controller.dart';
import 'package:posdelivery/providers/local/print_provider.dart';

class PrintScreenController extends BaseGetXController implements IPrintScreenController {
  PrintProvider printProvider = Get.find<PrintProvider>();
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/modules/pos/contract.dart';
import 'package:posdelivery/controllers/base_controller.dart';
import 'package:posdelivery/models/response/pos/billers.dart';
import 'package:posdelivery/models/response/pos/warehouse.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class FindCustomerScreenController extends BaseGetXController implements IFindCustomerScreenController {
  final RxString _cWareHouseName = RxString('');
  final RxString _cBillerName = RxString('');
  final RxBool scanner = RxBool(false);

  // FindCustomerScreenController(this.qrController, this.result);
  String get cWareHouseName => _cWareHouseName.value;
  String get cBillerName => _cBillerName.value;
  //QRViewController qrController;
  //Barcode result;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void onInit() {
    _cWareHouseName.value = appService.myInfoResponse.cWareHouse?.name ?? '';
    _cBillerName.value = appService.myInfoResponse.cBiller?.name ?? '';
    print("load from array");
    super.onInit();
  }

  // void onQRViewCreated(QRViewController qrCont) {
  //   qrController = qrCont;
  //   qrController.scannedDataStream.listen((scanData) {
  //     print("got qr data");
  //     result = scanData;
  //   });
  // }

  void changeBiller(String value) {
    final Billers searchB = appService.myInfoResponse.billers?.firstWhere((element) => element.id == value);
    if (searchB != null) {
      appService.myInfoResponse.billerId = searchB.id;
      _cBillerName.value = searchB.name ?? '';
    }
  }

  void changeWarehouse(String value) {
    final Warehouses searchW = appService.myInfoResponse.warehouses?.firstWhere((element) => element.id == value);
    if (searchW != null) {
      appService.myInfoResponse.warehouseId = searchW.id;
      _cWareHouseName.value = searchW.name ?? '';
    }
  }
}

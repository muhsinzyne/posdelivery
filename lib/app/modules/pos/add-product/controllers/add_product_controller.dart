import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/modules/pos/contract.dart';
import 'package:posdelivery/controllers/base_controller.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/models/response/pos/product.dart';
import 'package:posdelivery/models/response/pos/units.dart';

class ProductPurchaseInfo {
  String subTotal;
  String discount;
  String tax;
  String taxAmount;
  String totalAmount;
  String qty;
  String unit;
  String rate;
  ProductPurchaseInfo();
}

class AddProductController extends BaseGetXController implements IAddProductController {
  final productName = TextEditingController();
  final productQty = TextEditingController();
  final unit = TextEditingController();
  final rate = TextEditingController();
  Units cUnit = Units();
  RxList<Units> units = RxList([]);
  RxString cUnitName = RxString('');
  var productInfo = ProductPurchaseInfo().obs;

  Product product;
  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
    _autoFillForm();
  }

  @override
  void onReady() {
    super.onReady();
  }

  actionOnChangeUnit(String unit) {
    cUnit = product.units.firstWhere((element) => element.id == unit);
    cUnitName.value = cUnit.name;
  }

  _autoFillForm() {
    print(product.label);
    productName.text = product.row.name;
    productQty.text = Constants.no1;
    units.value = product.units;
    cUnit = product.units.first;
    rate.text = product.row.price.toDouble().toStringAsFixed(2);
    cUnitName.value = cUnit.name;
    productInfo.value.subTotal = calculateSubTotal();
  }

  calculateSubTotal() {
    var unitPrice = 0.0;
    var taxAmount = 0.0;
    var productTotal = 0.0;
    if (product.row.taxMethod == Constants.taxInclusive) {
      // tax inclusive
      unitPrice = (product.row.price * int.tryParse(productQty.text));
      unitPrice -= ((product.row.price * int.tryParse(productQty.text) / 100) * double.tryParse(product.taxRate.rate));
      print(unitPrice);
    } else {
      // tax eclusive
    }
    //return product.row.price +
    return '0';
  }
}

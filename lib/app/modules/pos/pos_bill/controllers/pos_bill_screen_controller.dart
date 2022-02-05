import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posdelivery/app/modules/pos/add-product/views/product_search.dart';
import 'package:posdelivery/app/modules/pos/contract.dart';
import 'package:posdelivery/controllers/base_controller.dart';

class PosBillScreenController extends BaseGetXController implements IPosBillScreenController {
  actionSearch(BuildContext context) {
    showSearch(context: context, delegate: ProductSearch());
  }
}

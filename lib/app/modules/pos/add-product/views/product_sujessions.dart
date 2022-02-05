import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:posdelivery/app/modules/pos/add-product/controllers/product_suggestion_controller.dart';
import 'package:posdelivery/models/response/pos/product.dart';

class ProductSuggestionView extends GetView<ProductSuggestionController> {
  final String searchTerm;

  const ProductSuggestionView({key, this.searchTerm = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.actionLoadingSearch(searchTerm);
    return Obx(
      () {
        return Container(
          child: ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (BuildContext context, int i) {
              Product cProduct = controller.productList[i];
              return ListTile(
                onTap: () {
                  //print("tapped");
                  controller.actionSelectProduct(cProduct);
                },
                title: Text(cProduct.label),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/models/response/pos/units.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  final AddProductController addProductController = Get.find<AddProductController>();

  List<DropdownMenuItem<String>> generateUnitItems() {
    final List<DropdownMenuItem<String>> unitList = [];
    for (var element in controller.units) {
      Units cUnit = element;
      unitList.add(
        DropdownMenuItem<String>(
          value: cUnit.id,
          child: Container(
            width: 100,
            child: Text(
              cUnit.name.toString(),
            ),
          ),
        ),
      );
    }
    return unitList;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.bgLight,
        appBar: AppBar(
          title: Text('add_product'.tr),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(Constants.pagePadding10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.productName,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'product'.tr,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: TextField(
                        controller: controller.productName,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'quantity'.tr + ' *',
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 5,
                    child: Container(
                      //height: 100,
                      //color: Colors.red,
                      child: Obx(() {
                        return Container(
                          child: Row(
                            children: [
                              Container(
                                child: DropdownButton<String>(
                                  hint: Container(
                                    width: Get.size.width * .3,
                                    height: 100,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'unit'.tr + ' *',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(controller.cUnitName.value),
                                      ],
                                    ),
                                  ),
                                  //icon: const Icon(FontAwesomeIcons.shippingFast),

                                  iconSize: 24,
                                  elevation: 16,
                                  onChanged: (String newValue) {
                                    controller.actionOnChangeUnit(newValue);
                                  },
                                  items: generateUnitItems(),
                                ),
                                height: 75,
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: TextField(
                      controller: controller.rate,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'rate'.tr + '(' + 'price'.tr + '/' + 'unit'.tr + ') *',
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: AppColors.primary,
                      height: 200,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Center(
                          child: Text(
                            'total'.tr,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductSummaryInfo(
                          label: 'sub_total'.tr + '(' + 'rate'.tr + 'x' + 'qty'.tr + ')',
                          value: '15.00',
                        ),
                        ProductSummaryInfo(
                          label: 'discount'.tr,
                          value: '00.00',
                        ),
                        ProductSummaryInfo(
                          label: 'tax'.tr + '(' + 'excl'.tr + ')',
                          value: '00.00',
                        ),
                        ProductSummaryInfo(
                          label: 'tax_amount'.tr,
                          value: '00.00',
                        ),
                        ProductSummaryInfo(
                          label: 'total_amount'.tr,
                          value: '10.00',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductSummaryInfo extends StatelessWidget {
  const ProductSummaryInfo({
    Key key,
    this.label = '',
    this.value = '',
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Row(
                children: [
                  Container(
                    child: Text(
                      value,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

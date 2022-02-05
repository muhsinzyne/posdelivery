import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';
import 'package:posdelivery/app/ui/theme/styles.dart';
import 'package:posdelivery/models/constants.dart';

import '../controllers/pos_bill_screen_controller.dart';

class PosBillView extends GetView<PosBillScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        title: Text('add_sale'.tr + ' ' + ''),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(Constants.pagePadding10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Constants.pagePadding10, vertical: Constants.pagePadding10),
                    color: AppColors.secondary,
                    child: Text(
                      'order_items'.tr,
                      style: kBaseTextStyle.copyWith(
                        fontSize: 16,
                        color: AppColors.bgLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Material(
                    color: AppColors.primaryVariant,
                    child: InkWell(
                      onTap: () {
                        controller.actionSearch(context);
                      },
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'add_product'.tr,
                            style: kBaseTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    child: Material(
                      color: AppColors.primary,
                      child: InkWell(
                        onTap: () async {
                          // product
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.qr_code_scanner_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTileItem(
                    label: 'Product Name 1',
                    value: 'SR 100.00',
                    fontSize: 22,
                  ),
                  ProductTileItem(
                    label: 'Net unit price',
                    value: 'SR 80.50',
                    fontSize: 16,
                  ),
                  ProductTileItem(
                    label: 'Quantity',
                    value: '12',
                    fontSize: 16,
                  ),
                  ProductTileItem(
                    label: 'Product Tax',
                    value: 'SR 25.00',
                    fontSize: 16,
                  ),
                  ProductTileItem(
                    label: 'Sub total ',
                    value: '125.00',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTileItem extends StatelessWidget {
  const ProductTileItem({
    Key key,
    this.label,
    this.value,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
  }) : super(key: key);

  final String label;
  final String value;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label ?? '',
          style: kBaseTextStyle.copyWith(fontWeight: fontWeight, fontSize: fontSize),
        ),
        Text(
          value ?? '',
          style: kBaseTextStyle.copyWith(
            fontWeight: fontWeight,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

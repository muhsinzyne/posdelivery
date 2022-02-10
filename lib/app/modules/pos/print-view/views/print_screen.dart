import 'package:auto_size_text/auto_size_text.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:posdelivery/app/modules/pos/print-view/controllers/print_screen_controller.dart';
import 'package:posdelivery/app/test_print.dart';
import 'package:posdelivery/app/ui/components/buttons/bottom_sheet_btn.dart';
import 'package:posdelivery/app/ui/components/loading/cached_image_network.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';
import 'package:posdelivery/app/ui/theme/styles.dart';
import 'package:posdelivery/models/constants.dart';

class PrintScreen extends GetView<PrintScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        title: Text('print_invoice'.tr),
        centerTitle: true,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.printProvider.refreshBluetoothScan(),
          child: SingleChildScrollView(
            //physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: Constants.pagePadding, vertical: Constants.pagePadding5),
                          color: controller.printProvider.connected.value ? Colors.green : Colors.red,
                          child: Text(
                            controller.printProvider.conMsg.value,
                            style: kBaseTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'device'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              child: DropdownButton<dynamic>(
                                value: controller.printProvider.device,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                onChanged: (value) {
                                  controller.printProvider.device = value;
                                  controller.printProvider.connect();
                                },
                                items: controller.printProvider.allList.map<DropdownMenuItem<BluetoothDevice>>((value) {
                                  return DropdownMenuItem<BluetoothDevice>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Obx(
                              () {
                                return CCachedNetworkImage(
                                  imageUrl: (controller.invoiceResponse.value?.domain ?? '') +
                                      '/assets/uploads/' +
                                      (controller.invoiceResponse.value.userDirectory ?? '') +
                                      '/logos/' +
                                      (controller.invoiceResponse.value.biller?.logo ?? ''),
                                  fit: BoxFit.contain,
                                  width: 300,
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() {
                              return Text(
                                controller.invoiceResponse.value.biller?.name ?? '',
                                style: TextStyle(fontSize: 22),
                              );
                            }),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return AutoSizeText(
                                controller.invoiceResponse.value.biller?.address ?? '',
                                maxLines: 2,
                                style: TextStyle(fontSize: 16),
                              );
                            }),
                            Obx(() {
                              return AutoSizeText(
                                'tel'.tr + (controller.invoiceResponse.value.biller?.phone ?? ''),
                                maxLines: 2,
                                style: TextStyle(fontSize: 18),
                              );
                            }),
                            Obx(() {
                              return AutoSizeText(
                                'vat'.tr + (controller.invoiceResponse.value.biller?.vatNo ?? ''),
                                maxLines: 2,
                                style: TextStyle(fontSize: 18),
                              );
                            }),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              'tax_invoice'.tr.toUpperCase(),
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Text(
                                    'date'.tr + ': ' + (controller.invoiceResponse.value.inv?.date ?? ''),
                                    textAlign: TextAlign.start,
                                  );
                                }),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'sl_no'.tr + ': ' + (controller.invoiceResponse.value.inv?.referenceNo ?? ''),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Text(
                                    'sales_associate'.tr +
                                        ': ' +
                                        ((controller.invoiceResponse.value.createdBy?.firstName ?? '') +
                                            ' ' +
                                            (controller.invoiceResponse.value.createdBy?.lastName ?? '')),
                                    textAlign: TextAlign.start,
                                  );
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Text(
                                    'customer'.tr + ': ' + (controller.invoiceResponse.value.customer.name ?? ''),
                                    textAlign: TextAlign.start,
                                  );
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('items'.tr.toUpperCase()),
                            Divider(),
                            ItemsListTile(
                              number: '#',
                              itemName: 'item_name'.tr,
                              qty: 'qty'.tr,
                              unitPrice: 'upc'.tr,
                              taxAmount: 'tax_amt'.tr,
                              subTotal: 'sub_total'.tr,
                            ),
                            ItemsListTile(
                              number: '1',
                              itemName: 'Demo Priduct',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            ItemsListTile(
                              number: '2',
                              itemName: 'Demo dfsffhfh',
                              qty: '3',
                              unitPrice: '20.0',
                              taxAmount: '3.0',
                              subTotal: '23',
                            ),
                            Divider(),
                            ItemSummaryTile(
                              label: 'total'.tr,
                              value: '100.5',
                            ),
                            ItemSummaryTile(
                              label: 'grand_total'.tr,
                              value: '100.5',
                            ),
                            ItemSummaryTile(
                              label: 'paid'.tr,
                              value: '100.5',
                            ),
                            ItemSummaryTile(
                              label: 'balance'.tr,
                              value: '100.5',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Paid by: Cash'),
                                Text('Amount: 100.0'),
                                Text('Change: 0.0'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'tax_summary'.tr,
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'name'.tr,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'qty'.tr,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'tax_excl'.tr,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'tax_amount'.tr,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Column(
                                      children: [
                                        Text('vat @ 15'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('4'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('7.50'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('10.20'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                      // Container(
                      //   //color: Colors.red,
                      //   child: ListView.builder(
                      //     physics: ClampingScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: 100,
                      //     itemBuilder: (BuildContext context, int i) {
                      //       return ListTile(
                      //         leading: Icon(Icons.info),
                      //         title: Text('SMA100 - date $i'),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.refresh,
            ),
            label: 'refresh_bluetooth'.tr,
            onTap: () {
              controller.printProvider.refreshBluetoothScan();
              print("blutooth refresh");
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.bluetooth_disabled,
            ),
            label: 'disconnect'.tr,
            onTap: () {
              controller.printProvider.disconnect();
              print("blutooth refresh");
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.bluetooth,
            ),
            label: 'connect'.tr,
            onTap: () {
              controller.printProvider.connect();
              //print("blutooth refresh");
            },
          )
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        height: Get.height * .08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CBottomSheetBtn(
              color: AppColors.primaryVariant,
              icon: Icons.print,
              label: 'print'.tr,
              onTap: () {
                TestPrint test = new TestPrint();
                test.sample('');
              },
            ),
            CBottomSheetBtn(
              color: AppColors.secondary,
              icon: Icons.share,
              label: 'share_invoice'.tr,
              onTap: () {
                print("hello");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemSummaryTile extends StatelessWidget {
  final String label;
  final String value;

  const ItemSummaryTile({
    Key key,
    this.label = '',
    this.value = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class ItemsListTile extends StatelessWidget {
  final String number;
  final String itemName;
  final String qty;
  final String unitPrice;
  final String taxAmount;
  final String subTotal;

  const ItemsListTile({
    Key key,
    this.number = '',
    this.itemName = '',
    this.qty = '',
    this.unitPrice = '',
    this.taxAmount = '',
    this.subTotal = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Text(number),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: AutoSizeText(
                  itemName,
                  maxLines: 3,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: AutoSizeText(
                  qty,
                  maxLines: 3,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AutoSizeText(
                  unitPrice,
                  maxLines: 3,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AutoSizeText(
                  taxAmount,
                  maxLines: 3,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AutoSizeText(
                  subTotal,
                  maxLines: 3,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

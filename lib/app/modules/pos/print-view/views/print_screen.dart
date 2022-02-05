import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:posdelivery/app/modules/pos/print-view/controllers/print_screen_controller.dart';
import 'package:posdelivery/app/test_print.dart';
import 'package:posdelivery/app/ui/components/buttons/bottom_sheet_btn.dart';
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
            physics: ClampingScrollPhysics(),
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
                      // Container(
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 100,
                      //     itemBuilder: (BuildContext context, int i) {
                      //       return ListTile(
                      //         leading: Icon(Icons.info),
                      //         title: Text('SMA100 - date'),
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

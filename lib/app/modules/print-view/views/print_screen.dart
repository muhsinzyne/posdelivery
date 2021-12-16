import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:posdelivery/app/modules/print-view/controllers/print_screen_controller.dart';
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
          onRefresh: () => controller.refreshBluetoothScan(),
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
                          color: controller.connected.value ? Colors.green : Colors.red,
                          child: Text(
                            controller.conMsg.value,
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
                            'Device:',
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
                                hint: Text('Select a vehicle '),
                                value: controller.device,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                onChanged: (value) {
                                  controller.device = value;
                                },
                                items: controller.allList.map<DropdownMenuItem<BluetoothDevice>>((value) {
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.brown),
                            onPressed: () {
                              controller.initPlatformState();
                            },
                            child: Text(
                              'Refresh',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: controller.connected.value ? Colors.red : Colors.green),
                            onPressed: controller.connected.value ? controller.disconnect : controller.connect,
                            child: Text(
                              controller.connected.value ? 'disconnect'.tr : 'connect'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.brown),
                          onPressed: controller.testPrintItem,
                          child: Text('PRINT TEST', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

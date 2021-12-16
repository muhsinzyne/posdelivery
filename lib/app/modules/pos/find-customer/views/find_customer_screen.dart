import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';
import 'package:posdelivery/controllers/app_controller.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/models/response/pos/billers.dart';
import 'package:posdelivery/models/response/pos/warehouse.dart';
import 'package:posdelivery/services/app_service.dart';

import '../controllers/find_customer_controller.dart';

class FindCustomerScreen extends GetView<FindCustomerScreenController> {
  AppService appService = Get.find<AppService>();
  AppController appController = Get.find<AppController>();
  List<String> location = ['One', 'Two', 'Three', 'Four'];
  String dropDownValue = '';

  List<DropdownMenuItem<String>> generateWareHouseItems() {
    final List<DropdownMenuItem<String>> wareHouseLists = [];
    for (var element in appService.myInfoResponse.warehouses) {
      Warehouses cWare = element;
      wareHouseLists.add(
        DropdownMenuItem<String>(
          value: cWare.id,
          child: Container(
            width: Get.width * .7,
            child: Text(
              cWare.name.toString(),
            ),
          ),
        ),
      );
    }
    return wareHouseLists;
  }

  List<DropdownMenuItem<String>> generateBillerItems() {
    final List<DropdownMenuItem<String>> billerList = [];
    for (var element in appService.myInfoResponse.billers) {
      Billers cBiller = element;
      billerList.add(
        DropdownMenuItem<String>(
          value: cBiller.id,
          child: Container(
            width: Get.width * .7,
            child: Text(
              cBiller.name.toString(),
            ),
          ),
        ),
      );
    }
    return billerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        title: Text('Sales - Select Customer'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Constants.pagePadding, vertical: Constants.pagePadding),
        child: Column(
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  hint: Container(
                    width: Get.size.width * .8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('vehicle'.tr),
                        SizedBox(
                          height: 4,
                        ),
                        Obx(() {
                          return Text(controller.cWareHouseName);
                        }),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(FontAwesomeIcons.shippingFast),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    controller.changeWarehouse(newValue);
                    // setState(() {
                    //   dropdownValue = newValue!;
                    // });
                  },
                  items: generateWareHouseItems(),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton<String>(
                  hint: Container(
                    width: Get.size.width * .8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('biller'.tr),
                        SizedBox(
                          height: 4,
                        ),
                        Obx(() {
                          return Text(controller.cBillerName);
                        }),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(FontAwesomeIcons.cashRegister),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    controller.changeBiller(newValue);
                  },
                  items: generateBillerItems(),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: DropdownSearch<String>(
                      mode: Mode.DIALOG,
                      showSelectedItems: false,
                      items: [
                        "Brazil",
                        "Italia",
                        "Tunisia",
                        "Canada",
                        "Italia",
                        "Tunisia",
                        "Canada",
                        "Italia",
                        "Tunisia",
                        'Canada',
                      ],
                      label: "select_customer".tr,
                      hint: "select_customer".tr,
                      onChanged: print,
                      selectedItem: "Brazil",
                      showSearchBox: true,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Material(
                      color: AppColors.primary,
                      child: InkWell(
                        onTap: () async {
                          FlutterBeep.playSysSound(AndroidSoundIDs.TONE_DTMF_C);
                          //appController.playSound(PlaySound.success);
                          //Get.to(CustomerScanQr())?.then((value) => print(value));
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
          ],
        ),
      ),
    );
  }
}

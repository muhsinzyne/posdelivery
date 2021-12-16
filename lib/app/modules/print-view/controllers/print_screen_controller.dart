import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:posdelivery/app/modules/print-view/contracts.dart';
import 'package:posdelivery/app/test_print.dart';
import 'package:posdelivery/controllers/base_controller.dart';
import 'package:posdelivery/models/constants.dart';

class PrintScreenController extends BaseGetXController implements IPrintScreenController {
  @override
  void onInit() {
    loadImage();
    super.onInit();
  }

  @override
  void onReady() {
    initPlatformState();
    super.onReady();
  }

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  RxList<BluetoothDevice> allList = RxList([]);
  List<BluetoothDevice> devices = [];
  BluetoothDevice device;
  BluetoothDevice selectedDevice;
  TestPrint testPrint;
  String logoImage = '';
  final RxBool connected = RxBool(false);
  final RxBool _printerConn = RxBool(false);
  final RxString conMsg = RxString('no_connected_devise'.tr);

  bool get printerConn => _printerConn.value;

  set printerConn(bool value) {
    _printerConn.value = value;
  }

  Future refreshBluetoothScan() async {
    await Future.delayed(Constants.fourSec);
  }

  void testPrintItem() {
    bluetooth.isConnected.then((isConnected) {
      bluetooth.printImage(logoImage);
      bluetooth.printNewLine();
      bluetooth.printCustom("DEMO BILLER", 1, 1);
      bluetooth.printCustom("demo address demo city 001 demo state 01", 0, 1);
      bluetooth.printCustom("Tel: 00550055", 0, 1);
      bluetooth.printCustom("VAT NO: 300926682900003", 1, 1);
      bluetooth.printCustom("SIMPLIFIED TAX INVOICE", 1, 1);
      bluetooth.printNewLine();
      bluetooth.printCustom("Date: 15/12/2021 23:43", 0, 0);
      bluetooth.printCustom("Sale No/Ref: SALE00000014", 0, 0);
      bluetooth.printCustom("Sales Associate: MUHAMMED MUHSIN", 0, 0);
      bluetooth.printCustom("Customer: Walk In-customer", 0, 0);
      bluetooth.printNewLine();
      bluetooth.printCustom("ITEMS", 1, 1);
      bluetooth.printCustom("----------------------------------", 0, 1);
      bluetooth.printLeftRight("#1: SHIRT", "*vat-15", 0);
      bluetooth.printCustom("US POLO ASSN", 0, 0);
      bluetooth.printLeftRight("1.00 x SR 75.90 - Tax (vat-15) SR 9.90", "SR 75.90", 0);
      bluetooth.printCustom("----------------------------------", 0, 1);
      bluetooth.printLeftRight("Total", "SR 75.90", 1);
      bluetooth.printLeftRight("Grand Total", "SR 75.90", 1);
      bluetooth.printCustom("----------------------------------", 0, 1);
      bluetooth.print3Column("Paid by: Cash", "Amount: SR 75.90", "Change: 0", 1);
      bluetooth.printNewLine();
      bluetooth.printCustom("Tax Summary", 1, 0);
      bluetooth.print4Column("Name", "Qty", "Tax Ex", "Tax Amt", 0);
      bluetooth.print4Column("V-15", "1.00", "SR 66.00", "SR 9.90", 0);
      bluetooth.print3Column("", "Total Tax", "SR 9.90", 1);
      bluetooth.printNewLine();
      bluetooth.printQRcode("Insert Your Own Text to Generate", 200, 200, 1);
      bluetooth.printCustom("Thank you", 0, 1);
      bluetooth.paperCut();
    });
  }

  void connect() {
    if (device == null) {
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(device).catchError((error) {
            connected.value = false;
          });
          connected.value = true;
        }
      });
    }
  }

  void disconnect() {
    bluetooth.disconnect();
    connected.value = false;
  }

  Future<void> initPlatformState() async {
    bool isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> tempList = [];
    try {
      devices = await bluetooth.getBondedDevices();
      allList.value = devices;
      print(devices);
    } on PlatformException {
      // TODO - Error
      print("exeptions");
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          connected.value = true;
          break;
        case BlueThermalPrinter.DISCONNECTED:
          connected.value = false;
          break;
        default:
          print(state);
          break;
      }
    });
    if (isConnected) {
      connected.value = true;
    }
  }

  // List<DropdownMenuItem<BluetoothDevice>> getDeviceItems() {
  //   List<DropdownMenuItem<BluetoothDevice>> items = [];
  //   if (devices.isEmpty) {
  //     items.add(DropdownMenuItem(
  //       child: Text('NONE'),
  //     ));
  //   } else {
  //     for (var device in devices) {
  //       items.add(DropdownMenuItem(
  //         child: Text(device.name),
  //         value: device,
  //       ));
  //     }
  //   }
  //   return items;
  // }

  void loadImage() {
    var url = 'https://demo.pos.slasah.com/assets/uploads/demo/logos/New_Project.png';
    var filename = Uri.parse(url).pathSegments.last;
    downloadImage(filename, url).then((bytes) {
      print(logoImage);
    });
  }

  Future<dynamic> downloadImage(filename, url) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');

    if (file.existsSync()) {
      print('file already exist');
      var image = await file.readAsBytes();

      logoImage = '$dir/$filename';
      return image;
    } else {
      print('file not found downloading from server');
      var request = await http.get(
        Uri.parse(url),
      );
      var bytes = request.bodyBytes;
      await file.writeAsBytes(bytes);
      logoImage = '$dir/$filename';
      return bytes;
    }
  }
}

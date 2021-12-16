import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/modules/print-view/contracts.dart';
import 'package:posdelivery/app/modules/print-view/test_print.dart';
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
  List<BluetoothDevice> devices = [];
  BluetoothDevice device;
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

  void testPrintItem() {}

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
      tempList = await bluetooth.getBondedDevices();
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
    print(devices);

    devices = tempList;
  }

  List<DropdownMenuItem<BluetoothDevice>> getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      for (var device in devices) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      }
    }
    return items;
  }

  void loadImage() {
    var image = 'https://demo.pos.slasah.com/assets/uploads/demo/logos/New_Project.png';
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:get/get.dart';
import 'package:posdelivery/controllers/app_controller.dart';
import 'package:posdelivery/services/app_service.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class CustomerScanQr extends StatefulWidget {
  const CustomerScanQr({Key key}) : super(key: key);

  @override
  _CustomerScanQrState createState() => _CustomerScanQrState();
}

class _CustomerScanQrState extends State<CustomerScanQr> {
  AppService appService = Get.find<AppService>();
  AppController appController = Get.find<AppController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  //Barcode result;
  //QRViewController controller;
  StreamSubscription streamSubscription;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      //controller.pauseCamera();
    } else {
      if (Platform.isIOS) {
        //controller.resumeCamera();
      }
    }
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   streamSubscription = controller.scannedDataStream.listen((scanData) {
  //     result = scanData;
  //     if (result?.code != null) {
  //       appController.playSound(PlaySound.success);
  //     }
  //     streamSubscription.cancel();
  //     print(result?.format);
  //     Get.back(result: result?.code);
  //   });
  // }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              // Expanded(
              //   flex: 2,
              //   child: QRView(
              //     key: qrKey,
              //     onQRViewCreated: _onQRViewCreated,
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      RaisedButton(child: Text("Beep Success"), onPressed: () => FlutterBeep.beep()),
                      RaisedButton(child: Text("Beep Fail"), onPressed: () => FlutterBeep.beep(false)),
                      RaisedButton(
                          child: Text("Beep Android Custom"),
                          onPressed: () => FlutterBeep.playSysSound(AndroidSoundIDs.TONE_CDMA_ABBR_ALERT)),
                      RaisedButton(child: Text("Beep somthing"), onPressed: () => FlutterBeep.playSysSound(41)),
                      RaisedButton(child: Text("Beep iOS Custom"), onPressed: () => FlutterBeep.playSysSound(iOSSoundIDs.AudioToneBusy)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onWillPop: () async {
          // String barcodeData = result?.code;
          // Get.back(result: barcodeData);
          return false;
        },
      );
}

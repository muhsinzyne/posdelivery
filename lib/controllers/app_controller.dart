import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/config/flavor/flavor_service.dart';
import 'package:posdelivery/app/routes/app_pages.dart';
import 'package:posdelivery/app/ui/components/ui_notification.dart';
import 'package:posdelivery/models/app_languages.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/services/app_service.dart';

class AppController extends GetxController {
  AppService appService;

  GlobalKey<ScaffoldState> appDrawerKey = GlobalKey<ScaffoldState>();
  //AudioPlayer audioPlayer = AudioPlayer();
  @override
  void onInit() {
    appService = Get.find<AppService>();
    super.onInit();
  }

  void changeAppLanguage(Locale requestLocale) {
    if (requestLocale.countryCode != '' && requestLocale.languageCode != '') {
      Get.updateLocale(requestLocale);
    } else {
      // same language requesting again
    }
  }

  void _closeDrawer() {
    if (appDrawerKey.currentState.isDrawerOpen) {
      appDrawerKey.currentState.openEndDrawer();
    }
  }

  void toggleLanguage() {
    if (Get.locale == AppLanguages.en_US) {
      Get.updateLocale(AppLanguages.ar_SA);
    } else {
      Get.updateLocale(AppLanguages.en_US);
    }
  }

  void appClearKeyboardFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void appBarLogout() async {
    _closeDrawer();
    UINotification.showLoading();
    appService.authToken = Constants.none;
    await Future.delayed(Constants.oneSecDuration);
    UINotification.hideLoading();
    Get.offNamed(Routes.login);
  }

  void actionChangeLanguage() {
    _closeDrawer();
    Get.toNamed(Routes.changeLanguage);
  }

  void actionMyAccount() {
    _closeDrawer();
    Get.toNamed(Routes.myAccount);
  }

  void playSound(PlaySound type) {
    switch (type) {
      case PlaySound.success:
        print("hello");
        //audioPlayer.play('assets/sounds/walmart_scanner.mp3', isLocal: true);
        break;
      default:
        //FlutterBeep.beep(FlutterBeep.ScreenLocked);
        break;
    }
  }

  demo() {}

  String get appVersion {
    try {
      return " ${Constants.version} ${appService.packageInfo?.version ?? Constants.defaultAppVersionD} - ${appService.packageInfo?.buildNumber ?? Constants.defaultAppBuildNo}";
    } on Exception {
      return Constants.version;
    }
  }
}

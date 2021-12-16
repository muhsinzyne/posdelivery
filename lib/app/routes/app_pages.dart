import 'package:get/get.dart';
import 'package:posdelivery/app/modules/auth/licence/bindings/licence_screen_binding.dart';
import 'package:posdelivery/app/modules/auth/licence/views/licence_screen.dart';
import 'package:posdelivery/app/modules/auth/login/bindings/login_screen_binding.dart';
import 'package:posdelivery/app/modules/auth/login/views/login_screen.dart';
import 'package:posdelivery/app/modules/auth/otp_verification/bindings/otp_verification_binding.dart';
import 'package:posdelivery/app/modules/auth/otp_verification/views/otp_verification_view.dart';
import 'package:posdelivery/app/modules/dashboard/bindings/dashboard_screen_binding.dart';
import 'package:posdelivery/app/modules/dashboard/views/dashboard_screen.dart';
import 'package:posdelivery/app/modules/my-account/bindings/my_account_binding.dart';
import 'package:posdelivery/app/modules/my-account/views/my_account_view.dart';
import 'package:posdelivery/app/modules/pos/find-customer/bindings/find_customer_screen_binding.dart';
import 'package:posdelivery/app/modules/pos/find-customer/views/find_customer_screen.dart';
import 'package:posdelivery/app/modules/print-view/bindings/print_screen_binding.dart';
import 'package:posdelivery/app/modules/print-view/views/print_screen.dart';
import 'package:posdelivery/app/modules/settings/change-language/bindings/change_language_binding.dart';
import 'package:posdelivery/app/modules/settings/change-language/views/change_language_view.dart';
import 'package:posdelivery/app/modules/splash/bindings/splash_screen_binding.dart';
import 'package:posdelivery/app/modules/splash/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: _Paths.otpVerification,
      page: () => OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.changeLanguage,
      page: () => ChangeLanguageView(),
      binding: ChangeLanguageBinding(),
    ),
    GetPage(
      name: _Paths.myAccount,
      page: () => MyAccountView(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: _Paths.licence,
      page: () => LicenceScreen(),
      binding: LicenceBinding(),
    ),
    GetPage(
      name: _Paths.findCustomer,
      page: () => FindCustomerScreen(),
      binding: FindCustomerScreenBinding(),
    ),
    GetPage(
      name: _Paths.printView,
      page: () => PrintScreen(),
      binding: PrintScreenBinding(),
    ),
  ];
}

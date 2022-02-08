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
import 'package:posdelivery/app/modules/pos/add-product/bindings/add_product_binding.dart';
import 'package:posdelivery/app/modules/pos/add-product/views/add_product_view.dart';
import 'package:posdelivery/app/modules/pos/find-customer/bindings/find_customer_screen_binding.dart';
import 'package:posdelivery/app/modules/pos/find-customer/views/find_customer_screen.dart';
import 'package:posdelivery/app/modules/pos/pos-payment/bindings/pos_payment_binding.dart';
import 'package:posdelivery/app/modules/pos/pos-payment/views/pos_payment_view.dart';
import 'package:posdelivery/app/modules/pos/pos_bill/bindings/pos_bill_screen_binding.dart';
import 'package:posdelivery/app/modules/pos/pos_bill/views/pos_bill_screen.dart';
import 'package:posdelivery/app/modules/pos/print-view/bindings/print_screen_binding.dart';
import 'package:posdelivery/app/modules/pos/print-view/views/print_screen.dart';
import 'package:posdelivery/app/modules/pos/sales-list/bindings/sales_list_screen_binding.dart';
import 'package:posdelivery/app/modules/pos/sales-list/views/sales_list_screen.dart';
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
    GetPage(
      name: _Paths.salesList,
      page: () => SalesListScreen(),
      binding: SalesListScreenBinding(),
    ),
    GetPage(
      name: _Paths.posBill,
      page: () => PosBillView(),
      binding: PosBillScreenBinding(),
    ),
    GetPage(
      name: _Paths.addProduct,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.posPayment,
      page: () => PosPaymentView(),
      binding: PosPaymentBinding(),
    ),
  ];
}

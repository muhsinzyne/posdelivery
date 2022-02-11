import 'package:get/get.dart';
import 'package:posdelivery/app/modules/crud/customer/customer-edit/bindings/customer_edit_binding.dart';
import 'package:posdelivery/app/modules/crud/customer/customer-edit/views/customer_edit_view.dart';
import 'package:posdelivery/app/modules/crud/customer/customer-list/bindings/customer_list_binding.dart';
import 'package:posdelivery/app/modules/crud/customer/customer-list/views/customer_list_view.dart';
import 'package:posdelivery/app/modules/crud/customer/customer-view/bindings/customer_view_binding.dart';
import 'package:posdelivery/app/modules/crud/customer/customer-view/views/customer_view_view.dart';

import '../modules/auth/licence/bindings/licence_screen_binding.dart';
import '../modules/auth/licence/views/licence_screen.dart';
import '../modules/auth/login/bindings/login_screen_binding.dart';
import '../modules/auth/login/views/login_screen.dart';
import '../modules/auth/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/auth/otp_verification/views/otp_verification_view.dart';
import '../modules/crud/customer/customer-add/bindings/customer_add_binding.dart';
import '../modules/crud/customer/customer-add/views/customer_add_view.dart';
import '../modules/dashboard/bindings/dashboard_screen_binding.dart';
import '../modules/dashboard/views/dashboard_screen.dart';
import '../modules/my-account/bindings/my_account_binding.dart';
import '../modules/my-account/views/my_account_view.dart';
import '../modules/payment/customer-payment/bindings/customer_payment_binding.dart';
import '../modules/payment/customer-payment/views/customer_payment_view.dart';
import '../modules/pos/add-product/bindings/add_product_binding.dart';
import '../modules/pos/add-product/views/add_product_view.dart';
import '../modules/pos/edit-product/bindings/edit_product_binding.dart';
import '../modules/pos/edit-product/views/edit_product_view.dart';
import '../modules/pos/find-customer/bindings/find_customer_screen_binding.dart';
import '../modules/pos/find-customer/views/find_customer_screen.dart';
import '../modules/pos/pos-payment/bindings/pos_payment_binding.dart';
import '../modules/pos/pos-payment/views/pos_payment_view.dart';
import '../modules/pos/pos_bill/bindings/pos_bill_screen_binding.dart';
import '../modules/pos/pos_bill/views/pos_bill_screen.dart';
import '../modules/pos/print-view/bindings/print_screen_binding.dart';
import '../modules/pos/print-view/views/print_screen.dart';
import '../modules/pos/sales-list/bindings/sales_list_screen_binding.dart';
import '../modules/pos/sales-list/views/sales_list_screen.dart';
import '../modules/settings/change-language/bindings/change_language_binding.dart';
import '../modules/settings/change-language/views/change_language_view.dart';
import '../modules/splash/bindings/splash_screen_binding.dart';
import '../modules/splash/views/splash_screen.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';

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
    GetPage(
      name: _Paths.editProduct,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.test,
      page: () => TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.customerPayment,
      page: () => CustomerPaymentView(),
      binding: CustomerPaymentBinding(),
    ),
    GetPage(
      name: _Paths.customerList,
      page: () => CustomerListView(),
      binding: CustomerListBinding(),
    ),
    GetPage(
      name: _Paths.customerView,
      page: () => CustomerViewView(),
      binding: CustomerViewBinding(),
    ),
    GetPage(
      name: _Paths.customerAdd,
      page: () => CustomerAddView(),
      binding: CustomerAddBinding(),
    ),
    GetPage(
      name: _Paths.customerEdit,
      page: () => CustomerEditView(),
      binding: CustomerEditBinding(),
    ),
  ];
}

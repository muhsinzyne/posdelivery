import 'package:posdelivery/app/config/flavor/src/flavor.dart';

class NetworkURL {
  static var api = FlavorConfig.instance.flavorValues.api;
  static var validateLicence = FlavorConfig.instance.flavorValues.licenceServer;
  static var base = api + '/api/';
  static var login = base + 'login';
  static var myInfo = base + 'users/my_info';
  static var salesList = base + 'pos/sales_list';
  static var allCustomerList = base + 'customers/customer_sujession';
  static var productSuj = base + 'pos/product_sujession';
}

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
  static var addSale = base + 'pos/add_sale';
  static var saleView = base + 'pos/sales_view';
  static var customerAndPriceGroup = base + 'customers/customer_and_price_group';
  static var customerAdd = base + 'customers/add';
  static var customerList = base + 'customers/customer_list';
}

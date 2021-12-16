import 'package:posdelivery/app/config/flavor/src/flavor.dart';

class NetworkURL {
  static var api = FlavorConfig.instance.flavorValues.api;
  static var validateLicence = FlavorConfig.instance.flavorValues.licenceServer;
  static var base = api + '/api/';
  static var login = base + 'login';
  static var myInfo = base + 'users/my_info';
}

import 'package:posdelivery/models/response/auth/employee_info.dart';

abstract class IDashboardScreenController {
  void onLoadTokenValid(EmployeeInfo employeeInfo);
  void onLoadTokenInvalid();
}

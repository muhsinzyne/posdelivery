import 'package:posdelivery/models/response/error_message.dart';
import 'package:posdelivery/models/response/pos/customer_list_response.dart';
import 'package:posdelivery/models/response/pos/product_suggestion_response.dart';
import 'package:posdelivery/models/response/pos/sales_list_response.dart';

abstract class IPosBillScreenController {}

abstract class IFindCustomerScreenController {
  onCustomerListDone(CustomerListResponse cListResponse);
  onCustomerListError(ErrorMessage err);
}

abstract class ISalesListScreenController {
  onSalesListResponseDone(SalesListResponse salesListResponse);
  onSalesListResponseBadRequest(ErrorMessage errorMessage);
}

abstract class IAddProductController {}

abstract class IProductSuggestionController {
  onSuggestionDone(ProductSuggestionResponse pResponse);
  onSuggestionError(ErrorMessage err);
}

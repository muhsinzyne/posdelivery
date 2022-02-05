import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:posdelivery/app/modules/contracts.dart';
import 'package:posdelivery/app/modules/pos/contract.dart';
import 'package:posdelivery/models/requests/pos/customer_list.dart';
import 'package:posdelivery/models/requests/pos/product_suggestion.dart';
import 'package:posdelivery/models/requests/pos/sales_list_request.dart';
import 'package:posdelivery/models/response/error_message.dart';
import 'package:posdelivery/models/response/pos/customer_list_response.dart';
import 'package:posdelivery/models/response/pos/product_suggestion_response.dart';
import 'package:posdelivery/models/response/pos/sales_list_response.dart';
import 'package:posdelivery/models/status_codes.dart';
import 'package:posdelivery/models/url.dart';
import 'package:posdelivery/providers/data/base_data_provider.dart';
import 'package:posdelivery/services/app_service.dart';

class PosDataProvider extends BaseDataProvider {
  AppService appService = Get.find<AppService>();
  ISalesListScreenController saleListCtrl;
  IBaseGetXController bCtrl;
  IFindCustomerScreenController iFindCCtrl;
  IProductSuggestionController pSujCtrl;

  set callBack(IBaseGetXController controller) {
    bCtrl = controller;
  }

  set pSujCallBack(IProductSuggestionController controller) {
    pSujCtrl = controller;
  }

  set findCustomerCallBack(IFindCustomerScreenController controller) {
    iFindCCtrl = controller;
  }

  set salesListCallBack(ISalesListScreenController controller) {
    saleListCtrl = controller;
  }

  getProductSuggestion(String term) {
    ProductSuggestionRequest pSugReq = ProductSuggestionRequest();
    pSugReq.term = term;
    pSugReq.warehouseId = appService.myInfoResponse.warehouseId;

    final obs = network.get(NetworkURL.productSuj, queryParameters: pSugReq.toJson()).asStream();
    obs.listen((data) {
      try {
        ProductSuggestionResponse pResponse = ProductSuggestionResponse.fromJSON(data.data);
        pSujCtrl.onSuggestionDone(pResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        pSujCtrl.onSuggestionError(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        //saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    });
  }

  getAllCustomerList() {
    CustomerListRequest cList = CustomerListRequest();
    cList.type = 'all';

    final obs = network.get(NetworkURL.allCustomerList, queryParameters: cList.toJson()).asStream();
    obs.listen((data) {
      print(data);
      try {
        CustomerListResponse cListResponse = CustomerListResponse.fromJSON(data.data);
        iFindCCtrl.onCustomerListDone(cListResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        iFindCCtrl.onCustomerListError(errMsg);
      }
    }, onError: (err) {
      print("on error called");
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        //saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    });
  }

  getSalesList(SalesListRequest salesListRequest) {
    final obs = network.get(NetworkURL.salesList, queryParameters: salesListRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        SalesListResponse salesListResponse = SalesListResponse.fromJSON(data.data);
        saleListCtrl.onSalesListResponseDone(salesListResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    });
  }
}

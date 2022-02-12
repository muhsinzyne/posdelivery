import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:posdelivery/app/modules/contracts.dart';
import 'package:posdelivery/app/modules/crud/contracts.dart';
import 'package:posdelivery/app/modules/pos/contract.dart';
import 'package:posdelivery/app/modules/pos/print-view/contracts.dart';
import 'package:posdelivery/models/requests/customer/customer_add_request.dart';
import 'package:posdelivery/models/requests/customer/customer_list_request.dart';
import 'package:posdelivery/models/requests/pos/customer_list.dart';
import 'package:posdelivery/models/requests/pos/product_suggestion.dart';
import 'package:posdelivery/models/requests/pos/sale_request.dart';
import 'package:posdelivery/models/requests/pos/sale_view_request.dart';
import 'package:posdelivery/models/requests/pos/sales_list_request.dart';
import 'package:posdelivery/models/response/customer/customer_account_list_response.dart';
import 'package:posdelivery/models/response/customer/customer_add_response.dart';
import 'package:posdelivery/models/response/error_message.dart';
import 'package:posdelivery/models/response/pos/add_sale_response.dart';
import 'package:posdelivery/models/response/pos/customer_list_response.dart';
import 'package:posdelivery/models/response/pos/invoice_response.dart';
import 'package:posdelivery/models/response/pos/product_suggestion_response.dart';
import 'package:posdelivery/models/response/pos/sales_list_response.dart';
import 'package:posdelivery/models/status_codes.dart';
import 'package:posdelivery/models/url.dart';
import 'package:posdelivery/providers/data/base_data_provider.dart';
import 'package:posdelivery/services/app_service.dart';

import '../../models/response/customer/customer_price_group_response.dart';

class PosDataProvider extends BaseDataProvider {
  AppService appService = Get.find<AppService>();
  ISalesListScreenController saleListCtrl;
  IBaseGetXController bCtrl;
  IFindCustomerScreenController iFindCCtrl;
  IProductSuggestionController pSujCtrl;
  IPosPaymentController posPaymentCtrl;
  IPrintScreenController printCtrl;
  ICustomerAddController cAddCtrl;
  ICustomerListController cListCtrl;

  set callBack(IBaseGetXController controller) {
    bCtrl = controller;
  }

  set customerListCalBack(ICustomerListController controller) {
    cListCtrl = controller;
  }

  set printCtrlCallBack(IPrintScreenController controller) {
    printCtrl = controller;
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

  set posPaymentCallBack(IPosPaymentController controller) {
    posPaymentCtrl = controller;
  }

  set customerAddCtrlBack(ICustomerAddController controller) {
    cAddCtrl = controller;
  }

  customerAddRequest(CustomerAddRequest customerAddRequest) {
    final obs = network.post(NetworkURL.customerAdd, data: customerAddRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        CustomerAddResponse addResponse = CustomerAddResponse.fromJson(data.data);
        cAddCtrl.onCustomerAddDone(addResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        cAddCtrl.onCustomerAddError(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        cAddCtrl.onCustomerAddError(errMsg);
      }
    });
  }

  getCustomerGroupAndPriceGroup() {
    final obs = network
        .get(
          NetworkURL.customerAndPriceGroup,
        )
        .asStream();
    obs.listen((data) {
      try {
        CustomerPriceGroupsResponse customerPriceGroupsResponse = CustomerPriceGroupsResponse.fromJson(data.data);
        cAddCtrl.customerGroupFetchDone(customerPriceGroupsResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        cAddCtrl.onCustomerGroupFetchError(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        //saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    });
  }

  getSaleInvoice(SaleViewRequest saleViewRequest) {
    final obs = network.get(NetworkURL.saleView, queryParameters: saleViewRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        InvoiceResponse invoiceResponse = InvoiceResponse.fromJson(data.data);
        printCtrl.onSaleViewFetchDone(invoiceResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        printCtrl.onSaleViewError(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        //saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    });
  }

  saleOrderRequest(SaleRequest saleRequest) {
    final obs = network.post(NetworkURL.addSale, data: saleRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        AddSaleResponse addSaleResponse = AddSaleResponse.fromJSON(data.data);
        posPaymentCtrl.onSaleDone(addSaleResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        posPaymentCtrl.onSaleError(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        //saleListCtrl.onSalesListResponseBadRequest(errMsg);
      }
    });
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

  getCustomerListRequest(CustomerAccountListRequest cRequest) {
    final obs = network.get(NetworkURL.salesList, queryParameters: cRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        CustomerAccountListResponse cAccResponse = CustomerAccountListResponse.fromJSON(data.data);
        cListCtrl.onCustomerListFetchDone(cAccResponse);
      } on Exception {
        final ErrorMessage errMsg = ErrorMessage();
        errMsg.message = 'invalid_response'.tr;
        cListCtrl.onCustomerListFetchError(errMsg);
      }
    }, onError: (err) {
      final ErrorMessage errMsg = ErrorMessage.fromJSON(jsonDecode(err.response.toString()));
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {
        cListCtrl.onCustomerListFetchError(errMsg);
      }
    });
  }
}

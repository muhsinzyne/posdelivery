import 'package:posdelivery/models/response/pos/date_formats.dart';
import 'package:posdelivery/models/response/pos/default_currency.dart';
import 'package:posdelivery/models/response/pos/product_row.dart';
import 'package:posdelivery/models/response/pos/return_payments.dart';
import 'package:posdelivery/models/response/pos/return_rows.dart';
import 'package:posdelivery/models/response/pos/return_sale.dart';
import 'package:posdelivery/models/response/pos/sales_biller.dart';
import 'package:posdelivery/models/response/pos/sales_created_by.dart';
import 'package:posdelivery/models/response/pos/sales_customer.dart';
import 'package:posdelivery/models/response/pos/sales_inv.dart';
import 'package:posdelivery/models/response/pos/sales_pos.dart';
import 'package:posdelivery/models/response/pos/settings.dart';

class InvoiceResponse {
  String assets;
  Settings settings;
  DefaultCurrency defaultCurrency;
  bool owner;
  String customerName;
  String supplier;
  String admin;
  String gP;
  DateFormats dateFormats;
  String m;
  String v;
  String dtLang;
  String dpLang;
  List<Rows> rows;
  SalesBiller biller;
  SalesCustomer customer;
  bool payments;
  SalePos pos;
  String barcode;
  ReturnSale returnSale;

  List<ReturnRows> returnRows;
  List<ReturnPayments> returnPayments;
  Inv inv;
  String sid;
  bool modal;
  CreatedBy createdBy;
  bool printer;
  String pageTitle;
  String qrcodeImage;

  InvoiceResponse.fromJson(Map<String, dynamic> json) {
    assets = json['assets'];
    settings = json['Settings'] != null ? Settings.fromJson(json['Settings']) : null;
    defaultCurrency = json['default_currency'] != null ? DefaultCurrency.fromJson(json['default_currency']) : null;
    owner = json['Owner'];
    customerName = json['Customer'];
    supplier = json['Supplier'];
    admin = json['Admin'];
    gP = json['GP'];
    dateFormats = json['dateFormats'] != null ? DateFormats.fromJson(json['dateFormats']) : null;
    m = json['m'];
    v = json['v'];
    dtLang = json['dt_lang'];
    dpLang = json['dp_lang'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows.add(Rows.fromJson(v));
      });
    }
    biller = json['biller'] != null ? SalesBiller.fromJson(json['biller']) : null;
    if (json['customer'] != null) {
      customer = SalesCustomer.fromJson(json['customer']);
    } else {
      customer = null;
    }
    payments = json['payments'];
    pos = json['pos'] != null ? SalePos.fromJson(json['pos']) : null;
    barcode = json['barcode'];
    returnSale = json['return_sale'] != null ? ReturnSale.fromJson(json['return_sale']) : null;
    if (json['return_rows'] != null) {
      returnRows = <ReturnRows>[];
      json['return_rows'].forEach((v) {
        returnRows.add(ReturnRows.fromJson(v));
      });
    }
    if (json['return_payments'] != null) {
      returnPayments = <ReturnPayments>[];
      json['return_payments'].forEach((v) {
        returnPayments.add(ReturnPayments.fromJson(v));
      });
    }
    inv = json['inv'] != null ? Inv.fromJson(json['inv']) : null;
    sid = json['sid'];
    modal = json['modal'];
    createdBy = json['created_by'] != null ? CreatedBy.fromJson(json['created_by']) : null;
    printer = json['printer'];
    pageTitle = json['page_title'];
    qrcodeImage = json['qrcodeImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assets'] = assets;
    if (settings != null) {
      data['Settings'] = settings.toJson();
    }
    if (defaultCurrency != null) {
      data['default_currency'] = defaultCurrency.toJson();
    }
    data['Owner'] = owner;
    data['Customer'] = customer;
    data['Supplier'] = supplier;
    data['Admin'] = admin;
    data['GP'] = gP;
    if (dateFormats != null) {
      data['dateFormats'] = dateFormats.toJson();
    }
    data['m'] = m;
    data['v'] = v;
    data['dt_lang'] = dtLang;
    data['dp_lang'] = dpLang;
    if (rows != null) {
      data['rows'] = rows.map((v) => v.toJson()).toList();
    }
    if (biller != null) {
      data['biller'] = biller.toJson();
    }
    if (customer != null) {
      data['customer'] = customer.toJson();
    }
    data['payments'] = payments;
    if (pos != null) {
      data['pos'] = pos.toJson();
    }
    data['barcode'] = barcode;
    data['return_sale'] = returnSale.toJson();
    data['return_rows'] = returnRows;
    if (returnPayments != null) {
      data['return_payments'] = returnPayments.map((v) => v.toJson()).toList();
    }

    if (inv != null) {
      data['inv'] = inv.toJson();
    }
    if (returnRows != null) {
      data['return_rows'] = returnRows.map((v) => v.toJson()).toList();
    }
    data['sid'] = sid;
    data['modal'] = modal;
    if (createdBy != null) {
      data['created_by'] = createdBy.toJson();
    }
    data['printer'] = printer;
    data['page_title'] = pageTitle;
    data['qrcodeImage'] = qrcodeImage;
    return data;
  }
}

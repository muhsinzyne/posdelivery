class SalePos {
  String posId;
  String catLimit;
  String proLimit;
  String defaultCategory;
  String defaultCustomer;
  String defaultBiller;
  String displayTime;
  String cfTitle1;
  String cfTitle2;
  String cfValue1;
  String cfValue2;
  String receiptPrinter;
  String cashDrawerCodes;
  String focusAddItem;
  String addManualProduct;
  String customerSelection;
  String addCustomer;
  String toggleCategorySlider;
  String toggleSubcategorySlider;
  String cancelSale;
  String suspendSale;
  String printItemsList;
  String finalizeSale;
  String todaySale;
  String openHoldBills;
  String closeRegister;
  String keyboard;
  String posPrinters;
  String javaApplet;
  String productButtonColor;
  String tooltips;
  String paypalPro;
  String stripe;
  String rounding;
  String charPerLine;
  String pinCode;
  String purchaseCode;
  String envToUsername;
  String version;
  String afterSalePage;
  String itemOrder;
  String authorize;
  String toggleBrandsSlider;
  String remotePrinting;
  String printer;
  String orderPrinters;
  String autoPrint;
  String customerDetails;
  String localPrinters;

  SalePos();

  SalePos.fromJson(Map<String, dynamic> json) {
    posId = json['pos_id'];
    catLimit = json['cat_limit'];
    proLimit = json['pro_limit'];
    defaultCategory = json['default_category'];
    defaultCustomer = json['default_customer'];
    defaultBiller = json['default_biller'];
    displayTime = json['display_time'];
    cfTitle1 = json['cf_title1'];
    cfTitle2 = json['cf_title2'];
    cfValue1 = json['cf_value1'];
    cfValue2 = json['cf_value2'];
    receiptPrinter = json['receipt_printer'];
    cashDrawerCodes = json['cash_drawer_codes'];
    focusAddItem = json['focus_add_item'];
    addManualProduct = json['add_manual_product'];
    customerSelection = json['customer_selection'];
    addCustomer = json['add_customer'];
    toggleCategorySlider = json['toggle_category_slider'];
    toggleSubcategorySlider = json['toggle_subcategory_slider'];
    cancelSale = json['cancel_sale'];
    suspendSale = json['suspend_sale'];
    printItemsList = json['print_items_list'];
    finalizeSale = json['finalize_sale'];
    todaySale = json['today_sale'];
    openHoldBills = json['open_hold_bills'];
    closeRegister = json['close_register'];
    keyboard = json['keyboard'];
    posPrinters = json['pos_printers'];
    javaApplet = json['java_applet'];
    productButtonColor = json['product_button_color'];
    tooltips = json['tooltips'];
    paypalPro = json['paypal_pro'];
    stripe = json['stripe'];
    rounding = json['rounding'];
    charPerLine = json['char_per_line'];
    pinCode = json['pin_code'];
    purchaseCode = json['purchase_code'];
    envToUsername = json['envato_username'];
    version = json['version'];
    afterSalePage = json['after_sale_page'];
    itemOrder = json['item_order'];
    authorize = json['authorize'];
    toggleBrandsSlider = json['toggle_brands_slider'];
    remotePrinting = json['remote_printing'];
    printer = json['printer'];
    orderPrinters = json['order_printers'];
    autoPrint = json['auto_print'];
    customerDetails = json['customer_details'];
    localPrinters = json['local_printers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pos_id'] = posId;
    data['cat_limit'] = catLimit;
    data['pro_limit'] = proLimit;
    data['default_category'] = defaultCategory;
    data['default_customer'] = defaultCustomer;
    data['default_biller'] = defaultBiller;
    data['display_time'] = displayTime;
    data['cf_title1'] = cfTitle1;
    data['cf_title2'] = cfTitle2;
    data['cf_value1'] = cfValue1;
    data['cf_value2'] = cfValue2;
    data['receipt_printer'] = receiptPrinter;
    data['cash_drawer_codes'] = cashDrawerCodes;
    data['focus_add_item'] = focusAddItem;
    data['add_manual_product'] = addManualProduct;
    data['customer_selection'] = customerSelection;
    data['add_customer'] = addCustomer;
    data['toggle_category_slider'] = toggleCategorySlider;
    data['toggle_subcategory_slider'] = toggleSubcategorySlider;
    data['cancel_sale'] = cancelSale;
    data['suspend_sale'] = suspendSale;
    data['print_items_list'] = printItemsList;
    data['finalize_sale'] = finalizeSale;
    data['today_sale'] = todaySale;
    data['open_hold_bills'] = openHoldBills;
    data['close_register'] = closeRegister;
    data['keyboard'] = keyboard;
    data['pos_printers'] = posPrinters;
    data['java_applet'] = javaApplet;
    data['product_button_color'] = productButtonColor;
    data['tooltips'] = tooltips;
    data['paypal_pro'] = paypalPro;
    data['stripe'] = stripe;
    data['rounding'] = rounding;
    data['char_per_line'] = charPerLine;
    data['pin_code'] = pinCode;
    data['purchase_code'] = purchaseCode;
    data['envato_username'] = envToUsername;
    data['version'] = version;
    data['after_sale_page'] = afterSalePage;
    data['item_order'] = itemOrder;
    data['authorize'] = authorize;
    data['toggle_brands_slider'] = toggleBrandsSlider;
    data['remote_printing'] = remotePrinting;
    data['printer'] = printer;
    data['order_printers'] = orderPrinters;
    data['auto_print'] = autoPrint;
    data['customer_details'] = customerDetails;
    data['local_printers'] = localPrinters;
    return data;
  }
}

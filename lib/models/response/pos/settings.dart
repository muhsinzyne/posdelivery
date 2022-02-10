class Settings {
  String settingId;
  String logo;
  String logo2;
  String siteName;
  String language;
  String defaultWarehouse;
  String accountingMethod;
  String defaultCurrency;
  String defaultTaxRate;
  String rowsPerPage;
  String version;
  String defaultTaxRate2;
  String dateformat;
  String salesPrefix;
  String quotePrefix;
  String purchasePrefix;
  String transferPrefix;
  String deliveryPrefix;
  String paymentPrefix;
  String returnPrefix;
  String returnpPrefix;
  String expensePrefix;
  String itemAddition;
  String theme;
  String productSerial;
  String defaultDiscount;
  String productDiscount;
  String discountMethod;
  String tax1;
  String tax2;
  String overselling;
  String restrictUser;
  String restrictCalendar;
  String timezone;
  String iWidth;
  String iHeight;
  String tWidth;
  String tHeight;
  String watermark;
  String regVer;
  String allowReg;
  String regNotification;
  String autoReg;
  String protocol;
  String mailPath;
  String smtpHost;
  String smtpUser;
  String smtpPass;
  String smtpPort;
  String smtpCrypto;
  String corn;
  String customerGroup;
  String defaultEmail;
  String mMode;
  String bcFix;
  String autoDetectBarcode;
  String captcha;
  String referenceFormat;
  String racks;
  String attributes;
  String productExpiry;
  String decimals;
  String qtyDecimals;
  String decimalsSep;
  String thousandsSep;
  String invoiceView;
  String defaultBiller;
  String envToUsername;
  String purchaseCode;
  String rtl;
  String eachSpent;
  String caPoint;
  String eachSale;
  String saPoint;
  String update;
  String sac;
  String displayAllProducts;
  String displaySymbol;
  String symbol;
  String removeExpired;
  String barcodeSeparator;
  String setFocus;
  String priceGroup;
  String barcodeImg;
  String pPaymentPrefix;
  String disableEditing;
  String qaPrefix;
  String updateCost;
  String apis;
  String state;
  String pdfLib;
  String userLanguage;
  bool userRtl;
  bool indianGst;
  bool formatGst;

  Settings();

  Settings.fromJson(Map<String, dynamic> json) {
    settingId = json['setting_id'];
    logo = json['logo'];
    logo2 = json['logo2'];
    siteName = json['site_name'];
    language = json['language'];
    defaultWarehouse = json['default_warehouse'];
    accountingMethod = json['accounting_method'];
    defaultCurrency = json['default_currency'];
    defaultTaxRate = json['default_tax_rate'];
    rowsPerPage = json['rows_per_page'];
    version = json['version'];
    defaultTaxRate2 = json['default_tax_rate2'];
    dateformat = json['dateformat'];
    salesPrefix = json['sales_prefix'];
    quotePrefix = json['quote_prefix'];
    purchasePrefix = json['purchase_prefix'];
    transferPrefix = json['transfer_prefix'];
    deliveryPrefix = json['delivery_prefix'];
    paymentPrefix = json['payment_prefix'];
    returnPrefix = json['return_prefix'];
    returnpPrefix = json['returnp_prefix'];
    expensePrefix = json['expense_prefix'];
    itemAddition = json['item_addition'];
    theme = json['theme'];
    productSerial = json['product_serial'];
    defaultDiscount = json['default_discount'];
    productDiscount = json['product_discount'];
    discountMethod = json['discount_method'];
    tax1 = json['tax1'];
    tax2 = json['tax2'];
    overselling = json['overselling'];
    restrictUser = json['restrict_user'];
    restrictCalendar = json['restrict_calendar'];
    timezone = json['timezone'];
    iWidth = json['iwidth'];
    iHeight = json['iheight'];
    tWidth = json['twidth'];
    tHeight = json['theight'];
    watermark = json['watermark'];
    regVer = json['reg_ver'];
    allowReg = json['allow_reg'];
    regNotification = json['reg_notification'];
    autoReg = json['auto_reg'];
    protocol = json['protocol'];
    mailPath = json['mailpath'];
    smtpHost = json['smtp_host'];
    smtpUser = json['smtp_user'];
    smtpPass = json['smtp_pass'];
    smtpPort = json['smtp_port'];
    smtpCrypto = json['smtp_crypto'];
    corn = json['corn'];
    customerGroup = json['customer_group'];
    defaultEmail = json['default_email'];
    mMode = json['mmode'];
    bcFix = json['bc_fix'];
    autoDetectBarcode = json['auto_detect_barcode'];
    captcha = json['captcha'];
    referenceFormat = json['reference_format'];
    racks = json['racks'];
    attributes = json['attributes'];
    productExpiry = json['product_expiry'];
    decimals = json['decimals'];
    qtyDecimals = json['qty_decimals'];
    decimalsSep = json['decimals_sep'];
    thousandsSep = json['thousands_sep'];
    invoiceView = json['invoice_view'];
    defaultBiller = json['default_biller'];
    envToUsername = json['envato_username'];
    purchaseCode = json['purchase_code'];
    rtl = json['rtl'];
    eachSpent = json['each_spent'];
    caPoint = json['ca_point'];
    eachSale = json['each_sale'];
    saPoint = json['sa_point'];
    update = json['update'];
    sac = json['sac'];
    displayAllProducts = json['display_all_products'];
    displaySymbol = json['display_symbol'];
    symbol = json['symbol'];
    removeExpired = json['remove_expired'];
    barcodeSeparator = json['barcode_separator'];
    setFocus = json['set_focus'];
    priceGroup = json['price_group'];
    barcodeImg = json['barcode_img'];
    pPaymentPrefix = json['ppayment_prefix'];
    disableEditing = json['disable_editing'];
    qaPrefix = json['qa_prefix'];
    updateCost = json['update_cost'];
    apis = json['apis'];
    state = json['state'];
    pdfLib = json['pdf_lib'];
    userLanguage = json['user_language'];
    userRtl = json['user_rtl'];
    indianGst = json['indian_gst'];
    formatGst = json['format_gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['setting_id'] = settingId;
    data['logo'] = logo;
    data['logo2'] = logo2;
    data['site_name'] = siteName;
    data['language'] = language;
    data['default_warehouse'] = defaultWarehouse;
    data['accounting_method'] = accountingMethod;
    data['default_currency'] = defaultCurrency;
    data['default_tax_rate'] = defaultTaxRate;
    data['rows_per_page'] = rowsPerPage;
    data['version'] = version;
    data['default_tax_rate2'] = defaultTaxRate2;
    data['dateformat'] = dateformat;
    data['sales_prefix'] = salesPrefix;
    data['quote_prefix'] = quotePrefix;
    data['purchase_prefix'] = purchasePrefix;
    data['transfer_prefix'] = transferPrefix;
    data['delivery_prefix'] = deliveryPrefix;
    data['payment_prefix'] = paymentPrefix;
    data['return_prefix'] = returnPrefix;
    data['returnp_prefix'] = returnpPrefix;
    data['expense_prefix'] = expensePrefix;
    data['item_addition'] = itemAddition;
    data['theme'] = theme;
    data['product_serial'] = productSerial;
    data['default_discount'] = defaultDiscount;
    data['product_discount'] = productDiscount;
    data['discount_method'] = discountMethod;
    data['tax1'] = tax1;
    data['tax2'] = tax2;
    data['overselling'] = overselling;
    data['restrict_user'] = restrictUser;
    data['restrict_calendar'] = restrictCalendar;
    data['timezone'] = timezone;
    data['iwidth'] = iWidth;
    data['iheight'] = iHeight;
    data['twidth'] = tWidth;
    data['theight'] = tHeight;
    data['watermark'] = watermark;
    data['reg_ver'] = regVer;
    data['allow_reg'] = allowReg;
    data['reg_notification'] = regNotification;
    data['auto_reg'] = autoReg;
    data['protocol'] = protocol;
    data['mailpath'] = mailPath;
    data['smtp_host'] = smtpHost;
    data['smtp_user'] = smtpUser;
    data['smtp_pass'] = smtpPass;
    data['smtp_port'] = smtpPort;
    data['smtp_crypto'] = smtpCrypto;
    data['corn'] = corn;
    data['customer_group'] = customerGroup;
    data['default_email'] = defaultEmail;
    data['mmode'] = mMode;
    data['bc_fix'] = bcFix;
    data['auto_detect_barcode'] = autoDetectBarcode;
    data['captcha'] = captcha;
    data['reference_format'] = referenceFormat;
    data['racks'] = racks;
    data['attributes'] = attributes;
    data['product_expiry'] = productExpiry;
    data['decimals'] = decimals;
    data['qty_decimals'] = qtyDecimals;
    data['decimals_sep'] = decimalsSep;
    data['thousands_sep'] = thousandsSep;
    data['invoice_view'] = invoiceView;
    data['default_biller'] = defaultBiller;
    data['envato_username'] = envToUsername;
    data['purchase_code'] = purchaseCode;
    data['rtl'] = rtl;
    data['each_spent'] = eachSpent;
    data['ca_point'] = caPoint;
    data['each_sale'] = eachSale;
    data['sa_point'] = saPoint;
    data['update'] = update;
    data['sac'] = sac;
    data['display_all_products'] = displayAllProducts;
    data['display_symbol'] = displaySymbol;
    data['symbol'] = symbol;
    data['remove_expired'] = removeExpired;
    data['barcode_separator'] = barcodeSeparator;
    data['set_focus'] = setFocus;
    data['price_group'] = priceGroup;
    data['barcode_img'] = barcodeImg;
    data['ppayment_prefix'] = pPaymentPrefix;
    data['disable_editing'] = disableEditing;
    data['qa_prefix'] = qaPrefix;
    data['update_cost'] = updateCost;
    data['apis'] = apis;
    data['state'] = state;
    data['pdf_lib'] = pdfLib;
    data['user_language'] = userLanguage;
    data['user_rtl'] = userRtl;
    data['indian_gst'] = indianGst;
    data['format_gst'] = formatGst;
    return data;
  }
}

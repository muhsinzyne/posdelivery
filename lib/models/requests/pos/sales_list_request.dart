class SalesListRequest {
  int page;
  int limit;
  int warehouseId;
  String orderBy = 'desc';
  SalesListRequest();
  SalesListRequest.fromJSON(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];
    limit = parsedJson['limit'];
    warehouseId = parsedJson['warehouse_id'];
    orderBy = parsedJson['order_by'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'limit': limit,
        'warehouse_id': warehouseId,
        'order_by': orderBy,
      };
}

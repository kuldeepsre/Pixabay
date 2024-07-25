import 'dart:convert';

import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/repository/OrdersRepo/orders_repository.interface.dart';
import 'package:http/http.dart' as http;
import '../../network/Api/api_endpoints.dart';
import '../../network/Exceptions/app_exceptions.dart';
import '../../network/Exceptions/exception_handlers.dart';

class OrdersRepository extends ApiEndpoints implements IOrdersrepository {
  @override
  Future<Map<String, dynamic>> newOrder(MyOrdersDataModel orderedItem) async {
    try {
      var mappedOrder = orderedItem.toJson();
      var response = await http.post(Uri.parse(newOrderUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(mappedOrder));
     return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getUserOrders(String userId) async {
    try {
      var response = await http.post(Uri.parse(getUserOrdersUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode({"userId": userId}));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> cancelUserOrders(
      String userId, String orderId) async {
    try {
      var response = await http.put(Uri.parse(cancelUserOrder),
          headers: {"content-type": "application/json"},
          body: jsonEncode({"userId": userId, "orderId": orderId}));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}



import 'package:fluxestore/models/my_orders_data_model.dart';

abstract class IOrdersrepository{
   Future<Map<String, dynamic>> newOrder(MyOrdersDataModel orderedItem);
   Future<Map<String, dynamic>> getUserOrders(String userId);
   Future<Map<String, dynamic>> cancelUserOrders(String userId,String docId);
}
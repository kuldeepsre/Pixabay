import 'dart:convert';

import 'package:fluxestore/models/cart_items_model.dart';
import 'package:fluxestore/repository/CartRepo/cart_repository.interface.dart';
import 'package:http/http.dart' as http;
import '../../network/Api/api_endpoints.dart';
import '../../network/Exceptions/app_exceptions.dart';
import '../../network/Exceptions/exception_handlers.dart';

class CartRepository extends ApiEndpoints implements ICartRepository {
  @override
  Future<Map<String, dynamic>> addTocart(CartItemsModel data) async {
    try {
      var cartItem = data.toJson();
      var response = await http.post(Uri.parse(addToCartUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(cartItem));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getCartItems(String userId) async {
    try {
      var response = await http.post(Uri.parse(getUserCartUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode({'userId': userId}));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> deleteCartItem(
      String userId, String docId) async {
    try {
      var quaries = {'docId': docId, 'userId': userId};

      var response = await http.delete(Uri.parse(deleteUserCartUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(quaries));

      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}

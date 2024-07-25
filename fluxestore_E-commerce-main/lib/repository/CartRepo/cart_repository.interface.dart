import 'package:fluxestore/models/cart_items_model.dart';

abstract class ICartRepository {
  Future<Map<String, dynamic>> addTocart(CartItemsModel cartedItem);
  Future<Map<String, dynamic>> getCartItems(String userId);
  Future<Map<String, dynamic>> deleteCartItem(String docId,String userId);
}

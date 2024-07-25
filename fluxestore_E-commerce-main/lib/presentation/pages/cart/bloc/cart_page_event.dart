part of 'cart_page_bloc.dart';

@immutable
sealed class CartPageEvent {}

class CartPageInitialEvent extends CartPageEvent {
  final String currentUserId;

  CartPageInitialEvent({required this.currentUserId});
}

class UpdateCartItemEvent extends CartPageEvent {
  final CartItemsModel updateditem;
  final List<CartItemsModel> originalcartList;

  UpdateCartItemEvent(
      {required this.originalcartList, required this.updateditem});
}

class RemoveAnItemFromCartEvent extends CartPageEvent {
  final String productId;
  final String userId;

  RemoveAnItemFromCartEvent({required this.productId, required this.userId});
}

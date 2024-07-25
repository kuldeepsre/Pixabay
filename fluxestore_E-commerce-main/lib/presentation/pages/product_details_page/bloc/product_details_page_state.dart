part of 'product_details_page_bloc.dart';

@immutable
sealed class ProductDetailsPageState {}

final class ProductDetailsPageInitialState extends ProductDetailsPageState {}

abstract class ProductDetailsPageActionState extends ProductDetailsPageState {}

class ProductDetailsPageSuccessState extends ProductDetailsPageState {
  final bool isWishListed;

  ProductDetailsPageSuccessState(
     {required this.isWishListed});
}

class AddToCartActionState extends ProductDetailsPageActionState {
  final List<CartItemsModel> cartItems;
  final double subTotal;

  final String message;
  final bool status;

  AddToCartActionState(
      {required this.message,
      required this.status,
      required this.subTotal,
      required this.cartItems});
}

class ProductDetailsPageWishListButtonActionState
    extends ProductDetailsPageState {
  final ProductDataModel wishlistedProduct;
  final bool isWishListed;

  ProductDetailsPageWishListButtonActionState({
    required this.wishlistedProduct,
    required this.isWishListed,
  });
}

part of 'product_details_page_bloc.dart';

@immutable
sealed class ProductDetailsPageEvent {}

class ProductDetailsPageInitialEvent extends ProductDetailsPageEvent {}

class AddToCartEvent extends ProductDetailsPageEvent {
  final CartItemsModel productData;

  AddToCartEvent({required this.productData});
}

class WishListButtonClickedEvent extends ProductDetailsPageEvent {
  final ProductDataModel product;
  final bool isWishListed;
  WishListButtonClickedEvent({required this.product,required this.isWishListed});
}

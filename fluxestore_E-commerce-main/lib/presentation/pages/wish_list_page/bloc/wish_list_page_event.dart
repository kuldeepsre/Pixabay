part of 'wish_list_page_bloc.dart';

@immutable
sealed class WishListPageEvent {}

class WishListInitialEvent extends WishListPageEvent{}

class RemoveItemFromWishListEvent extends WishListPageEvent {
  final ProductDataModel productDataModel;

  RemoveItemFromWishListEvent({required this.productDataModel});
}


class WishListProductCleckedEvent extends WishListPageEvent{
  final ProductDataModel productDataModel;

  WishListProductCleckedEvent({required this.productDataModel});
}
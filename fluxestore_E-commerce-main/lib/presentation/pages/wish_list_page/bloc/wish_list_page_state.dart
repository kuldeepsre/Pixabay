part of 'wish_list_page_bloc.dart';

@immutable
sealed class WishListPageState {}

final class WishListPageInitialState extends WishListPageState {}
class WishListActionState extends WishListPageState{}
class WishlistSuccessState extends WishListPageState {
  final List<ProductDataModel> wishlistedItemsList;

  WishlistSuccessState({required this.wishlistedItemsList});
}

class WishListProductClickedActionState extends WishListActionState{
  final ProductDataModel productDataModel;

  WishListProductClickedActionState({required this.productDataModel});
}
part of 'cart_page_bloc.dart';

@immutable
sealed class CartPageState {}

final class CartPageInitialState extends CartPageState {}

abstract class CartPageActionState extends CartPageState {}

class CartSuccessState extends CartPageState {
  final List<CartItemsModel> cartSuccessData;
  final double subTotal;

  CartSuccessState( {required this.subTotal,required this.cartSuccessData});
}

class UpdatedCartState extends CartPageState{
  final List<CartItemsModel> updatedCartData;

  UpdatedCartState({required this.updatedCartData});
}

class CartPageLoadingState extends CartPageState{}
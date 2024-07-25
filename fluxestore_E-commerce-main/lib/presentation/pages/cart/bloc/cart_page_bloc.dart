import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/models/cart_items_model.dart';
import 'package:fluxestore/repository/CartRepo/cart_repository.dart';
// ignore: unused_import
import 'package:meta/meta.dart';

part 'cart_page_event.dart';
part 'cart_page_state.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  CartPageBloc() : super(CartPageInitialState()) {
    on<CartPageInitialEvent>(cartPageInitialEvent);
    on<RemoveAnItemFromCartEvent>(removeAnItemFromCartEvent);
    on<UpdateCartItemEvent>(updateCartItemEvent);
  }
  //*GET cart items on initstate
  // List get getCarts => _tempCartList;
  FutureOr<void> cartPageInitialEvent(
      CartPageInitialEvent event, Emitter<CartPageState> emit) async {
    emit(CartPageLoadingState());
    List<CartItemsModel> tempCartList = [];
    //Cart repo fetches data
    var results = await CartRepository().getCartItems(event.currentUserId);
    if (results['status']) {
      var data = results['data'];

      for (var i = 0; i < data.length; i++) {
        //simple json Api response is mapped into CartItemsModel
        CartItemsModel responseCartItems = CartItemsModel.fromJson(data[i]);
        tempCartList.add(responseCartItems);
      }

      await Future.delayed(const Duration(seconds: 1));
      emit(CartSuccessState(
          cartSuccessData: tempCartList,
          subTotal: CartItemsModel().subTotal(tempCartList)));
    }
  }

  //*DELETE an item from cart
  FutureOr<void> removeAnItemFromCartEvent(
      RemoveAnItemFromCartEvent event, Emitter<CartPageState> emit) async {
    emit(CartPageLoadingState());
    List<CartItemsModel> tempCartList = [];

    var results =
        await CartRepository().deleteCartItem(event.userId, event.productId);

    if (results['status']) {
      //Delete api gives the list of all other cart items as well- so that we don't need to call the get cart api again!
      var data = results['data'];
      for (var i = 0; i < data.length; i++) {
        //simple json Api response is mapped in to CartItemsModel
        CartItemsModel responseCartItems = CartItemsModel.fromJson(data[i]);
        tempCartList.add(responseCartItems);
      }
      emit(CartSuccessState(
          cartSuccessData: tempCartList,
          subTotal: CartItemsModel().subTotal(tempCartList)));
    }
  }

  //*UPDATE Cart items
  FutureOr<void> updateCartItemEvent(
      UpdateCartItemEvent event, Emitter<CartPageState> emit) async {
    // getting the current list items as event.originalcartList  via the list tile
    for (int i = 0; i < event.originalcartList.length; i++) {
      //checking and just updating for a single state only
      //the reason is the user can update at that current state of the cart by increasing the quantity or uncheck the product
      //unwanted item for check out
      if (event.originalcartList[i].id == event.updateditem.id) {
        //updating by assiging the updated item to the original item
        event.originalcartList[i] = event.updateditem;
        emit(CartSuccessState(
          cartSuccessData: event.originalcartList,
          subTotal: CartItemsModel().subTotal(event.originalcartList),
        ));
        break;
      }
    }
  }
}

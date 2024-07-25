import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fluxestore/data/cart_items.dart';
import 'package:fluxestore/data/wish_listed_data.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/repository/CartRepo/cart_repository.dart';
import 'package:meta/meta.dart';
import '../../../../models/cart_items_model.dart';
part 'product_details_page_event.dart';
part 'product_details_page_state.dart';

class ProductDetailsPageBloc
    extends Bloc<ProductDetailsPageEvent, ProductDetailsPageState> {
  ProductDetailsPageBloc() : super(ProductDetailsPageInitialState()) {
    on<ProductDetailsPageInitialEvent>(productDetailsPageInitialEvent);
    on<AddToCartEvent>(addToCartEvent);
    on<WishListButtonClickedEvent>(wishListButtonClickedEvent);
  }

  FutureOr<void> addToCartEvent(
      AddToCartEvent event, Emitter<ProductDetailsPageState> emit) async {
    var results = await CartRepository().addTocart(event.productData);
    if (results['status']) {
      emit(AddToCartActionState(
          subTotal: CartItemsModel().subTotal(cartItems),
          cartItems: cartItems,
          message: 'Added to cart!',
          status: true));
    } else {
      emit(AddToCartActionState(
          subTotal: CartItemsModel().subTotal(cartItems),
          cartItems: cartItems,
          message: results['message'],
          status: false));
    }
  }

  FutureOr<void> productDetailsPageInitialEvent(
      ProductDetailsPageInitialEvent event,
      Emitter<ProductDetailsPageState> emit) async {
    emit(ProductDetailsPageSuccessState(
      isWishListed: false,
    ));
  }

  FutureOr<void> wishListButtonClickedEvent(
      WishListButtonClickedEvent event, Emitter<ProductDetailsPageState> emit) {
    if (event.isWishListed) {
      wishListedItems.add(event.product);
    } else {
      wishListedItems.remove(event.product);
    }
    emit(ProductDetailsPageSuccessState(
      isWishListed: event.isWishListed,
    ));
  }
}

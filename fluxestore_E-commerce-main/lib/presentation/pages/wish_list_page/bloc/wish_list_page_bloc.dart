import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/data/wish_listed_data.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'wish_list_page_event.dart';
part 'wish_list_page_state.dart';

class WishListPageBloc extends Bloc<WishListPageEvent, WishListPageState> {
  WishListPageBloc() : super(WishListPageInitialState()) {
    on<WishListInitialEvent>(wishListPageInitial);
    on<WishListProductCleckedEvent>(wishListProductCleckedEvent);
    on<RemoveItemFromWishListEvent>(removeItemFromWishListEvent);
  }

  FutureOr<void> wishListPageInitial(
      WishListInitialEvent event, Emitter<WishListPageState> emit) {
    emit(WishlistSuccessState(wishlistedItemsList: wishListedItems));
  }

  FutureOr<void> removeItemFromWishListEvent(
      RemoveItemFromWishListEvent event, Emitter<WishListPageState> emit) {
    if (!event.productDataModel.favorite!) {
      wishListedItems.remove(event.productDataModel);
    } else {
      wishListedItems.add(event.productDataModel);
    }
    
    emit(WishlistSuccessState(wishlistedItemsList: wishListedItems));
  }
  

  FutureOr<void> wishListProductCleckedEvent(
      WishListProductCleckedEvent event, Emitter<WishListPageState> emit) {
    emit(WishListProductClickedActionState(
        productDataModel: event.productDataModel));
  }
}

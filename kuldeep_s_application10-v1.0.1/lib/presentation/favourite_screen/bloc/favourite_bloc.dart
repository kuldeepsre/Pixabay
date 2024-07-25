import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/favourite_item_model.dart';
import 'package:kuldeep_s_application10/presentation/favourite_screen/models/favourite_model.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

/// A bloc that manages the state of a Favourite according to the event that is dispatched to it.
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc(FavouriteState initialState) : super(initialState) {
    on<FavouriteInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FavouriteInitialEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(
        favouriteModelObj: state.favouriteModelObj?.copyWith(
      favouriteItemList: fillFavouriteItemList(),
    )));
  }

  List<FavouriteItemModel> fillFavouriteItemList() {
    return [
      FavouriteItemModel(
          bestSeller: ImageConstant.imgPngitem555064281x125,
          favorite: ImageConstant.imgFavoriteRed300,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Jordan",
          price: "58.7",
          image: ImageConstant.imgUserTeal200),
      FavouriteItemModel(
          bestSeller: ImageConstant.imgNikeZoomWinfl81x125,
          favorite: ImageConstant.imgFavoriteWhiteA70028x28,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Air Max",
          price: "37.8",
          image: ImageConstant.imgSettingsBlueGray600),
      FavouriteItemModel(
          bestSeller: ImageConstant.imgNikeAh805011086x125,
          favorite: ImageConstant.imgFavoriteWhiteA70028x28,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Club Max",
          price: "47.7",
          image: ImageConstant.imgClose),
      FavouriteItemModel(
          bestSeller: ImageConstant.imgPngaaa81x125,
          favorite: ImageConstant.imgFavoriteWhiteA70028x28,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Air Max",
          price: "57.6",
          image: ImageConstant.imgSettingsIndigo400)
    ];
  }
}

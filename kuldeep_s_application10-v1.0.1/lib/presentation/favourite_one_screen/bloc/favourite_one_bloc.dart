import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/favouriteone_item_model.dart';
import 'package:kuldeep_s_application10/presentation/favourite_one_screen/models/favourite_one_model.dart';
part 'favourite_one_event.dart';
part 'favourite_one_state.dart';

/// A bloc that manages the state of a FavouriteOne according to the event that is dispatched to it.
class FavouriteOneBloc extends Bloc<FavouriteOneEvent, FavouriteOneState> {
  FavouriteOneBloc(FavouriteOneState initialState) : super(initialState) {
    on<FavouriteOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FavouriteOneInitialEvent event,
    Emitter<FavouriteOneState> emit,
  ) async {
    emit(state.copyWith(
        favouriteOneModelObj: state.favouriteOneModelObj?.copyWith(
      favouriteoneItemList: fillFavouriteoneItemList(),
    )));
  }

  List<FavouriteoneItemModel> fillFavouriteoneItemList() {
    return [
      FavouriteoneItemModel(
          bestSeller: ImageConstant.imgPngitem5550642,
          favorite: ImageConstant.imgFavoriteRed300,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Jordan",
          price: "58.7",
          image: ImageConstant.imgUserTeal200),
      FavouriteoneItemModel(
          bestSeller: ImageConstant.imgNikeZoomWinfl81x125,
          favorite: ImageConstant.imgFavoriteGray90002,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Air Max",
          price: "37.8",
          image: ImageConstant.imgSettingsBlueGray600),
      FavouriteoneItemModel(
          bestSeller: ImageConstant.imgNikeAh805011081x125,
          favorite: ImageConstant.imgFavoriteGray90002,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Club Max",
          price: "47.7",
          image: ImageConstant.imgClose),
      FavouriteoneItemModel(
          bestSeller: ImageConstant.imgPngaaa,
          favorite: ImageConstant.imgFavoriteGray90002,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Air Max",
          price: "57.6",
          image: ImageConstant.imgSettingsIndigo400)
    ];
  }
}

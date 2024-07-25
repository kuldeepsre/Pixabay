import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/bestsellerone_item_model.dart';
import 'package:kuldeep_s_application10/presentation/best_seller_one_screen/models/best_seller_one_model.dart';
part 'best_seller_one_event.dart';
part 'best_seller_one_state.dart';

/// A bloc that manages the state of a BestSellerOne according to the event that is dispatched to it.
class BestSellerOneBloc extends Bloc<BestSellerOneEvent, BestSellerOneState> {
  BestSellerOneBloc(BestSellerOneState initialState) : super(initialState) {
    on<BestSellerOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    BestSellerOneInitialEvent event,
    Emitter<BestSellerOneState> emit,
  ) async {
    emit(state.copyWith(
        bestSellerOneModelObj: state.bestSellerOneModelObj?.copyWith(
      bestselleroneItemList: fillBestselleroneItemList(),
    )));
  }

  List<BestselleroneItemModel> fillBestselleroneItemList() {
    return [
      BestselleroneItemModel(
          bestSeller: ImageConstant.img81a48fdfedf49d01,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Force",
          menSShoes: "Men’s Shoes",
          price: "367.76",
          image: ImageConstant.imgCloseBlue200),
      BestselleroneItemModel(
          bestSeller: ImageConstant.imgPngitem2129108PrevUi83x125,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Max",
          menSShoes: "Men’s Shoes",
          price: "254.89",
          image: ImageConstant.imgContrast),
      BestselleroneItemModel(
          bestSeller: ImageConstant.imgNikeEpicReact1,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Jordan",
          menSShoes: "Men’s Shoes",
          price: "367.76",
          image: ImageConstant.imgGrid),
      BestselleroneItemModel(
          bestSeller: ImageConstant.imgPngitem16773183x125,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Max",
          menSShoes: "Men’s Shoes",
          price: "254.89",
          image: ImageConstant.imgCloseIndigo800),
      BestselleroneItemModel(
          bestSeller: ImageConstant.imgPngitem15637184x129,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Force",
          menSShoes: "Men’s Shoes",
          price: "367.76",
          image: ImageConstant.imgGridIndigo300),
      BestselleroneItemModel(
          bestSeller: ImageConstant.imgAirMax2021Sh,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Max",
          menSShoes: "Men’s Shoes",
          price: "254.89",
          image: ImageConstant.imgGroup176)
    ];
  }
}

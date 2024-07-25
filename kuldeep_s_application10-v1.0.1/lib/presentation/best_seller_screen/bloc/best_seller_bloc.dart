import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/bestseller_item_model.dart';
import 'package:kuldeep_s_application10/presentation/best_seller_screen/models/best_seller_model.dart';
part 'best_seller_event.dart';
part 'best_seller_state.dart';

/// A bloc that manages the state of a BestSeller according to the event that is dispatched to it.
class BestSellerBloc extends Bloc<BestSellerEvent, BestSellerState> {
  BestSellerBloc(BestSellerState initialState) : super(initialState) {
    on<BestSellerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    BestSellerInitialEvent event,
    Emitter<BestSellerState> emit,
  ) async {
    emit(state.copyWith(
        bestSellerModelObj: state.bestSellerModelObj?.copyWith(
      bestsellerItemList: fillBestsellerItemList(),
    )));
  }

  List<BestsellerItemModel> fillBestsellerItemList() {
    return [
      BestsellerItemModel(
          bestSeller: ImageConstant.img81a48fdfedf49d083x125,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Force",
          menSShoes: "Men’s Shoes",
          price: "367.76",
          image: ImageConstant.imgCloseBlue200),
      BestsellerItemModel(
          bestSeller: ImageConstant.imgPngitem2129108PrevUi,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Max",
          menSShoes: "Men’s Shoes",
          price: "254.89",
          image: ImageConstant.imgContrast),
      BestsellerItemModel(
          bestSeller: ImageConstant.imgNikeEpicReact83x125,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Jordan",
          menSShoes: "Men’s Shoes",
          price: "367.76",
          image: ImageConstant.imgGrid),
      BestsellerItemModel(
          bestSeller: ImageConstant.imgPngitem167731,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Max",
          menSShoes: "Men’s Shoes",
          price: "254.89",
          image: ImageConstant.imgCloseIndigo800),
      BestsellerItemModel(
          bestSeller: ImageConstant.imgPngitem156371,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Force",
          menSShoes: "Men’s Shoes",
          price: "367.76",
          image: ImageConstant.imgGridIndigo300),
      BestsellerItemModel(
          bestSeller: ImageConstant.imgAirMax2021Sh,
          bestSeller1: "Best Seller",
          nikeAirForce: "Nike Air Max",
          menSShoes: "Men’s Shoes",
          price: "254.89",
          image: ImageConstant.imgGroup176)
    ];
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/home_item_model.dart';
import 'package:kuldeep_s_application10/presentation/home_screen/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  List<HomeItemModel> fillHomeItemList() {
    return [
      HomeItemModel(
          bestSeller: ImageConstant.imgPngitem5550642,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Jordan",
          price: "493.00"),
      HomeItemModel(
          bestSeller: ImageConstant.imgNikeZoomWinfl,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Air Max",
          price: "897.99")
    ];
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      settingsController: TextEditingController(),
    ));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
      homeItemList: fillHomeItemList(),
    )));
  }
}

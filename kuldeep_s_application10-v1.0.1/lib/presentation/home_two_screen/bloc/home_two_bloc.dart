import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/hometwo_item_model.dart';
import 'package:kuldeep_s_application10/presentation/home_two_screen/models/home_two_model.dart';
part 'home_two_event.dart';
part 'home_two_state.dart';

/// A bloc that manages the state of a HomeTwo according to the event that is dispatched to it.
class HomeTwoBloc extends Bloc<HomeTwoEvent, HomeTwoState> {
  HomeTwoBloc(HomeTwoState initialState) : super(initialState) {
    on<HomeTwoInitialEvent>(_onInitialize);
  }

  List<HometwoItemModel> fillHometwoItemList() {
    return [
      HometwoItemModel(
          bestSeller: ImageConstant.imgPngitem555064281x125,
          bestSeller1: "Best Seller",
          nikeJordan: "Nike Jordan",
          price: "493.00")
    ];
  }

  _onInitialize(
    HomeTwoInitialEvent event,
    Emitter<HomeTwoState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      settingsController: TextEditingController(),
    ));
    emit(state.copyWith(
        homeTwoModelObj: state.homeTwoModelObj?.copyWith(
      hometwoItemList: fillHometwoItemList(),
    )));
  }
}

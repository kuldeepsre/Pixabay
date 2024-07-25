import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/mycartone_item_model.dart';
import 'package:kuldeep_s_application10/presentation/my_cart_one_screen/models/my_cart_one_model.dart';
part 'my_cart_one_event.dart';
part 'my_cart_one_state.dart';

/// A bloc that manages the state of a MyCartOne according to the event that is dispatched to it.
class MyCartOneBloc extends Bloc<MyCartOneEvent, MyCartOneState> {
  MyCartOneBloc(MyCartOneState initialState) : super(initialState) {
    on<MyCartOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MyCartOneInitialEvent event,
    Emitter<MyCartOneState> emit,
  ) async {
    emit(state.copyWith(
        myCartOneModelObj: state.myCartOneModelObj?.copyWith(
      mycartoneItemList: fillMycartoneItemList(),
    )));
  }

  List<MycartoneItemModel> fillMycartoneItemList() {
    return [
      MycartoneItemModel(
          nikeClubMax: ImageConstant.imgNikeEpicReact,
          nikeClubMax1: "Nike Club Max",
          price: "64.95",
          l: "L",
          one: "1",
          image: ImageConstant.imgDeleteIcon),
      MycartoneItemModel(
          nikeClubMax: ImageConstant.imgPngaaa57x82,
          nikeClubMax1: "Nike Air Max 200",
          price: "64.95",
          l: "XL")
    ];
  }
}

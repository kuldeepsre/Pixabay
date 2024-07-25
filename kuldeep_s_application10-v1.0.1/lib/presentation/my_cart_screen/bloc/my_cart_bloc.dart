import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/mycart_item_model.dart';
import 'package:kuldeep_s_application10/presentation/my_cart_screen/models/my_cart_model.dart';
part 'my_cart_event.dart';
part 'my_cart_state.dart';

/// A bloc that manages the state of a MyCart according to the event that is dispatched to it.
class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  MyCartBloc(MyCartState initialState) : super(initialState) {
    on<MyCartInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MyCartInitialEvent event,
    Emitter<MyCartState> emit,
  ) async {
    emit(state.copyWith(
        myCartModelObj: state.myCartModelObj?.copyWith(
      mycartItemList: fillMycartItemList(),
    )));
  }

  List<MycartItemModel> fillMycartItemList() {
    return [
      MycartItemModel(
          nikeClubMax: ImageConstant.imgNikeEpicReact57x83,
          nikeClubMax1: "Nike Club Max",
          price: "64.95",
          l: "L",
          one: "1",
          image: ImageConstant.imgDeleteIcon),
      MycartItemModel(
          nikeClubMax: ImageConstant.imgPngaaa3,
          nikeClubMax1: "Nike Air Max 200",
          price: "64.95",
          l: "XL",
          one: "1",
          image: ImageConstant.imgDeleteIconRed300)
    ];
  }
}

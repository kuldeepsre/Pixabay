import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/detailsone_item_model.dart';
import '../models/frame_item_model.dart';
import 'package:kuldeep_s_application10/presentation/details_one_screen/models/details_one_model.dart';
part 'details_one_event.dart';
part 'details_one_state.dart';

/// A bloc that manages the state of a DetailsOne according to the event that is dispatched to it.
class DetailsOneBloc extends Bloc<DetailsOneEvent, DetailsOneState> {
  DetailsOneBloc(DetailsOneState initialState) : super(initialState) {
    on<DetailsOneInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _onInitialize(
    DetailsOneInitialEvent event,
    Emitter<DetailsOneState> emit,
  ) async {
    emit(state.copyWith(
        detailsOneModelObj: state.detailsOneModelObj?.copyWith(
      detailsoneItemList: fillDetailsoneItemList(),
      frameItemList: fillFrameItemList(),
    )));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<DetailsOneState> emit,
  ) {
    List<FrameItemModel> newList =
        List<FrameItemModel>.from(state.detailsOneModelObj!.frameItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        detailsOneModelObj:
            state.detailsOneModelObj?.copyWith(frameItemList: newList)));
  }

  List<DetailsoneItemModel> fillDetailsoneItemList() {
    return [
      DetailsoneItemModel(group: ImageConstant.imgGroup138),
      DetailsoneItemModel(group: ImageConstant.imgGroup139),
      DetailsoneItemModel(group: ImageConstant.imgGroup140)
    ];
  }

  List<FrameItemModel> fillFrameItemList() {
    return List.generate(6, (index) => FrameItemModel());
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/frame2_item_model.dart';
import 'package:kuldeep_s_application10/presentation/details_screen/models/details_model.dart';
part 'details_event.dart';
part 'details_state.dart';

/// A bloc that manages the state of a Details according to the event that is dispatched to it.
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(DetailsState initialState) : super(initialState) {
    on<DetailsInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _onInitialize(
    DetailsInitialEvent event,
    Emitter<DetailsState> emit,
  ) async {
    emit(state.copyWith(
        detailsModelObj: state.detailsModelObj?.copyWith(
      frame2ItemList: fillFrame2ItemList(),
    )));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<DetailsState> emit,
  ) {
    List<Frame2ItemModel> newList =
        List<Frame2ItemModel>.from(state.detailsModelObj!.frame2ItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        detailsModelObj:
            state.detailsModelObj?.copyWith(frame2ItemList: newList)));
  }

  List<Frame2ItemModel> fillFrame2ItemList() {
    return List.generate(6, (index) => Frame2ItemModel());
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/searchone_item_model.dart';
import 'package:kuldeep_s_application10/presentation/search_one_screen/models/search_one_model.dart';
part 'search_one_event.dart';
part 'search_one_state.dart';

/// A bloc that manages the state of a SearchOne according to the event that is dispatched to it.
class SearchOneBloc extends Bloc<SearchOneEvent, SearchOneState> {
  SearchOneBloc(SearchOneState initialState) : super(initialState) {
    on<SearchOneInitialEvent>(_onInitialize);
  }

  List<SearchoneItemModel> fillSearchoneItemList() {
    return [
      SearchoneItemModel(nikeAirMaxShoes: "Nike Air Max Shoes"),
      SearchoneItemModel(nikeAirMaxShoes: "Nike Jordan Shoes"),
      SearchoneItemModel(nikeAirMaxShoes: "Nike Air Force Shoes"),
      SearchoneItemModel(nikeAirMaxShoes: "Nike Club Max Shoes"),
      SearchoneItemModel(nikeAirMaxShoes: "Snakers Nike Shoes"),
      SearchoneItemModel(nikeAirMaxShoes: "Regular Shoes")
    ];
  }

  _onInitialize(
    SearchOneInitialEvent event,
    Emitter<SearchOneState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        searchOneModelObj: state.searchOneModelObj?.copyWith(
      searchoneItemList: fillSearchoneItemList(),
    )));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/search_item_model.dart';
import 'package:kuldeep_s_application10/presentation/search_screen/models/search_model.dart';
part 'search_event.dart';
part 'search_state.dart';

/// A bloc that manages the state of a Search according to the event that is dispatched to it.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchInitialEvent>(_onInitialize);
  }

  List<SearchItemModel> fillSearchItemList() {
    return [
      SearchItemModel(nikeAirMaxShoes: "Nike Air Max Shoes"),
      SearchItemModel(nikeAirMaxShoes: "Nike Jordan Shoes"),
      SearchItemModel(nikeAirMaxShoes: "Nike Air Force Shoes"),
      SearchItemModel(nikeAirMaxShoes: "Nike Club Max Shoes"),
      SearchItemModel(nikeAirMaxShoes: "Snakers Nike Shoes"),
      SearchItemModel(nikeAirMaxShoes: "Regular Shoes")
    ];
  }

  _onInitialize(
    SearchInitialEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        searchModelObj: state.searchModelObj?.copyWith(
      searchItemList: fillSearchItemList(),
    )));
  }
}

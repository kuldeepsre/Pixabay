import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/repository/SearchRepo/search.repository.dart';
import 'package:meta/meta.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(SearchPageInitial()) {
    on<SearchPageInitialEvent>(_searchPageInitialEvent);
    on<SearchPageOnSearchEvent>(_searchPageOnSearchEvent);
  }

  FutureOr<void> _searchPageInitialEvent(
      SearchPageInitialEvent event, Emitter<SearchPageState> emit) {
    emit(SearchPageShowCaseState());
  }

  FutureOr<void> _searchPageOnSearchEvent(
      SearchPageOnSearchEvent event, Emitter<SearchPageState> emit) async {
    emit(SearchLoadingState());
    var results = await SearchRepository().searchProducts(event.query);
   
    if (results['status']) {
      var products = results['data'];
       List<ProductDataModel> responseItmes = [];
      for (var i = 0; i < products.length; i++) {
        products.remove('__v');
        ProductDataModel productData = ProductDataModel.fromJson(products[i]);
        responseItmes.add(productData);
      }

      if (responseItmes.isNotEmpty) {
        emit(SearchLoadedSucessstate(responseItems: responseItmes));
      } else {
        await Future.delayed(const Duration(seconds: 5));
        emit(SearchPageNoResponseState());
      }
    }
  }
}

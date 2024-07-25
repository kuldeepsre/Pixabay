import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/product_data_model.dart';
import '../../../../repository/productsRepo/products_repository.dart';

part 'products_page_event.dart';
part 'products_page_state.dart';

class ProductsPageBloc extends Bloc<ProductsPageEvent, ProductsPageState> {
  ProductsPageBloc() : super(ProductsPageInitial()) {
    on<ProductsPageInitialevent>(_productsPageInitialevent);
  }

  FutureOr<void> _productsPageInitialevent(
      ProductsPageInitialevent event, Emitter<ProductsPageState> emit) async {
    emit(ProductPageLoadingState());
    var products = await ProductsRepository().getAllProducts();
    if (products["status"]) {
      List<ProductDataModel> productsList = [];
      var productsData = products['data'];

      for (var i = 0; i < productsData.length; i++) {
        products.remove('__v');
        ProductDataModel item = ProductDataModel.fromJson(productsData[i]);
        productsList.add(item);
      }
      productsList.shuffle();
      await Future.delayed(const Duration(seconds: 2));
      emit(ProductPageSuccessState(products: productsList));
    }
  }
}

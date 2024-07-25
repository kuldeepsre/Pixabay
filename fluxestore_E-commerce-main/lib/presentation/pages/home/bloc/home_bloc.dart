import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/models/banners_data_model.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/repository/productsRepo/products_repository.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomeInitial()) {
    on<HomePageInitialEvent>(homePageInitialEvent);
  }

  FutureOr<void> homePageInitialEvent(
      HomePageInitialEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoadingState());

    var products = await ProductsRepository().getAllProducts();
    var banners = await ProductsRepository().getAllBanners();
     
    if (products["status"] && banners["status"]) {
      List<ProductDataModel> productsList = [];
      var productsData = products['data'];

      for (var i = 0; i < productsData.length; i++) {
        products.remove('__v');
        ProductDataModel item =
            ProductDataModel.fromJson(productsData[i]);
        productsList.add(item);
      }

      List<BannersDataModel> bannersList = [];
      var bannersData = banners['data'];
      for (var i = 0; i < bannersData.length; i++) {
        BannersDataModel item =
            BannersDataModel.fromJson(bannersData[i]);
        bannersList.add(item);
      }

      await Future.delayed(const Duration(seconds: 2));
      emit(HomePageLoadedSuccessState(
          loadedProductsList: productsList, loadedBannersList: bannersList));
    }
  }
}

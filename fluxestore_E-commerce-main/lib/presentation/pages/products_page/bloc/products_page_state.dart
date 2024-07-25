part of 'products_page_bloc.dart';

@immutable
sealed class ProductsPageState {}

final class ProductsPageInitial extends ProductsPageState {}

abstract class ProductsPageActionState extends ProductsPageState {}

class ProductPageLoadingState extends ProductsPageState {}

class ProductPageSuccessState extends ProductsPageState {
  final List<ProductDataModel> products;

  ProductPageSuccessState({required this.products});
}

class ProductsPageInitialState extends ProductsPageState {}

class ProductsPageErrorState extends ProductsPageState {}

class ProductsPageShowSnackBarActionState extends ProductsPageActionState {}

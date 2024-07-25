part of 'orders_page_bloc.dart';

@immutable
sealed class MyOrdersPageState {}

final class OrdersPageInitial extends MyOrdersPageState {}

class OrdersPageActionState extends MyOrdersPageState {}

class OrdersPageLoadingState extends MyOrdersPageState {}

class OrdersPageSuccessState extends MyOrdersPageState {
  final List<MyOrdersDataModel> pendingOrders;
  final List<MyOrdersDataModel> deliveredOrders;
  final List<MyOrdersDataModel> cancelledOrders;

  OrdersPageSuccessState({required this.pendingOrders, required this.deliveredOrders, required this.cancelledOrders});
}

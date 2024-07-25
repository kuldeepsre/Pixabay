part of 'orders_page_bloc.dart';

@immutable
sealed class OrdersPageEvent {}

class OrdersPageInitialEvent extends OrdersPageEvent {
  final String userId;

  OrdersPageInitialEvent({required this.userId});
}

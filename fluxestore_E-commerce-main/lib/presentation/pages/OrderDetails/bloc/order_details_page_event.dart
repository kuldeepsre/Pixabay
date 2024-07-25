part of 'order_details_page_bloc.dart';

@immutable
sealed class OrderDetailsPageEvent {}

class OrderDetailsPageInitialEvent extends OrderDetailsPageEvent {
  final DeliveryStatus status;

  OrderDetailsPageInitialEvent({required this.status});
}

class CancelOrderEvent extends OrderDetailsPageEvent {
  final String userId;
  final String orderId;

  CancelOrderEvent({required this.userId, required this.orderId});
}

class ConfirmCancellationEvent extends OrderDetailsPageEvent{
  final String userId;
  final String orderId;

  ConfirmCancellationEvent({required this.userId, required this.orderId});
}

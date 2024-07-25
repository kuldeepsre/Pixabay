part of 'order_details_page_bloc.dart';

@immutable
sealed class OrderDetailsPageState {}

final class OrderDetailsPageInitial extends OrderDetailsPageState {}

abstract class OrderDetailsPageActionState extends OrderDetailsPageState {}

class ShowLoadingActionState extends OrderDetailsPageActionState {
  final bool isLoading;

  ShowLoadingActionState({required this.isLoading});
}

class ShowConfirmationDialogActionState extends OrderDetailsPageActionState {
  final String userId;
  final String orderId;

  ShowConfirmationDialogActionState(
      {required this.userId, required this.orderId});
}

class PendingOrdersDetailsState extends OrderDetailsPageState {}

class DeliveredOrdersDetailsState extends OrderDetailsPageState {}

class CancelledOrdersDetailsState extends OrderDetailsPageState {}

class CancellationSuccessActionState extends OrderDetailsPageActionState {
  final String message;

  CancellationSuccessActionState({required this.message});
}

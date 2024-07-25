part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageState {}

abstract class CheckOutPageActionState extends CheckOutPageState {}

class InitialState extends CheckOutPageState {}

class CheckOutPageBlocInitialState extends CheckOutPageState {}

class PageLoadingState extends CheckOutPageState {}

class PageLoadingDialogActionState extends CheckOutPageActionState {
  final bool isLoading;

  PageLoadingDialogActionState({required this.isLoading});
}

class PageLoadedSuccessState extends CheckOutPageState {}

class PaymentPageState extends CheckOutPageState {
  final double subTotal;
  final DeliveryAddress address;

  PaymentPageState({required this.address, required this.subTotal});
}

class PlaceOrderActionSate extends CheckOutPageState {}

class PaymentCompletedState extends CheckOutPageState {}

class NavigateTohomePageActionState extends CheckOutPageActionState {}

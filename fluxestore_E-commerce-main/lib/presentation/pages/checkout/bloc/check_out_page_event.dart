part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageEvent {}

class CheckOutInitialEvent extends CheckOutPageEvent {}

class CheckOutPagePaymentEvent extends CheckOutPageEvent {
  final double subTotal;
  final DeliveryAddress addressData;
  CheckOutPagePaymentEvent({required this.addressData, required this.subTotal});
}

class CheckOutPagePlaceOrderEvent extends CheckOutPageEvent {
  final MyOrdersDataModel dataModel;
  final DeliveryAddress addressData;
  final String paymentMode;

  CheckOutPagePlaceOrderEvent({
    required this.addressData,
    required this.dataModel,
    required this.paymentMode, 
  });
}

class NavigateBackToHomePageEvent extends CheckOutPageEvent {}
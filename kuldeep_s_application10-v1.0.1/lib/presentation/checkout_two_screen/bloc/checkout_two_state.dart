// ignore_for_file: must_be_immutable

part of 'checkout_two_bloc.dart';

/// Represents the state of CheckoutTwo in the application.
class CheckoutTwoState extends Equatable {
  CheckoutTwoState({this.checkoutTwoModelObj});

  CheckoutTwoModel? checkoutTwoModelObj;

  @override
  List<Object?> get props => [
        checkoutTwoModelObj,
      ];

  CheckoutTwoState copyWith({CheckoutTwoModel? checkoutTwoModelObj}) {
    return CheckoutTwoState(
      checkoutTwoModelObj: checkoutTwoModelObj ?? this.checkoutTwoModelObj,
    );
  }
}

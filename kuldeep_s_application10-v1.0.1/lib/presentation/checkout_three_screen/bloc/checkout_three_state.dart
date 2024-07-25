// ignore_for_file: must_be_immutable

part of 'checkout_three_bloc.dart';

/// Represents the state of CheckoutThree in the application.
class CheckoutThreeState extends Equatable {
  CheckoutThreeState({this.checkoutThreeModelObj});

  CheckoutThreeModel? checkoutThreeModelObj;

  @override
  List<Object?> get props => [
        checkoutThreeModelObj,
      ];

  CheckoutThreeState copyWith({CheckoutThreeModel? checkoutThreeModelObj}) {
    return CheckoutThreeState(
      checkoutThreeModelObj:
          checkoutThreeModelObj ?? this.checkoutThreeModelObj,
    );
  }
}

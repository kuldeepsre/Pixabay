// ignore_for_file: must_be_immutable

part of 'checkout_one_bloc.dart';

/// Represents the state of CheckoutOne in the application.
class CheckoutOneState extends Equatable {
  CheckoutOneState({this.checkoutOneModelObj});

  CheckoutOneModel? checkoutOneModelObj;

  @override
  List<Object?> get props => [
        checkoutOneModelObj,
      ];

  CheckoutOneState copyWith({CheckoutOneModel? checkoutOneModelObj}) {
    return CheckoutOneState(
      checkoutOneModelObj: checkoutOneModelObj ?? this.checkoutOneModelObj,
    );
  }
}

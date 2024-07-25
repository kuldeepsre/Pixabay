// ignore_for_file: must_be_immutable

part of 'best_seller_bloc.dart';

/// Represents the state of BestSeller in the application.
class BestSellerState extends Equatable {
  BestSellerState({this.bestSellerModelObj});

  BestSellerModel? bestSellerModelObj;

  @override
  List<Object?> get props => [
        bestSellerModelObj,
      ];

  BestSellerState copyWith({BestSellerModel? bestSellerModelObj}) {
    return BestSellerState(
      bestSellerModelObj: bestSellerModelObj ?? this.bestSellerModelObj,
    );
  }
}

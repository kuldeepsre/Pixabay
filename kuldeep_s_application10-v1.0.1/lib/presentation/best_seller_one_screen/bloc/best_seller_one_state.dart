// ignore_for_file: must_be_immutable

part of 'best_seller_one_bloc.dart';

/// Represents the state of BestSellerOne in the application.
class BestSellerOneState extends Equatable {
  BestSellerOneState({this.bestSellerOneModelObj});

  BestSellerOneModel? bestSellerOneModelObj;

  @override
  List<Object?> get props => [
        bestSellerOneModelObj,
      ];

  BestSellerOneState copyWith({BestSellerOneModel? bestSellerOneModelObj}) {
    return BestSellerOneState(
      bestSellerOneModelObj:
          bestSellerOneModelObj ?? this.bestSellerOneModelObj,
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'my_cart_one_bloc.dart';

/// Represents the state of MyCartOne in the application.
class MyCartOneState extends Equatable {
  MyCartOneState({this.myCartOneModelObj});

  MyCartOneModel? myCartOneModelObj;

  @override
  List<Object?> get props => [
        myCartOneModelObj,
      ];

  MyCartOneState copyWith({MyCartOneModel? myCartOneModelObj}) {
    return MyCartOneState(
      myCartOneModelObj: myCartOneModelObj ?? this.myCartOneModelObj,
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'onboard_two_bloc.dart';

/// Represents the state of OnboardTwo in the application.
class OnboardTwoState extends Equatable {
  OnboardTwoState({this.onboardTwoModelObj});

  OnboardTwoModel? onboardTwoModelObj;

  @override
  List<Object?> get props => [
        onboardTwoModelObj,
      ];

  OnboardTwoState copyWith({OnboardTwoModel? onboardTwoModelObj}) {
    return OnboardTwoState(
      onboardTwoModelObj: onboardTwoModelObj ?? this.onboardTwoModelObj,
    );
  }
}

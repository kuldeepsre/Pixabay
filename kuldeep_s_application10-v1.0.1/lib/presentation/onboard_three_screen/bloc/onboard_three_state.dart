// ignore_for_file: must_be_immutable

part of 'onboard_three_bloc.dart';

/// Represents the state of OnboardThree in the application.
class OnboardThreeState extends Equatable {
  OnboardThreeState({this.onboardThreeModelObj});

  OnboardThreeModel? onboardThreeModelObj;

  @override
  List<Object?> get props => [
        onboardThreeModelObj,
      ];

  OnboardThreeState copyWith({OnboardThreeModel? onboardThreeModelObj}) {
    return OnboardThreeState(
      onboardThreeModelObj: onboardThreeModelObj ?? this.onboardThreeModelObj,
    );
  }
}

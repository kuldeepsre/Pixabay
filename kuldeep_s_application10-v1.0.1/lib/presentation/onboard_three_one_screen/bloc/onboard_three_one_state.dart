// ignore_for_file: must_be_immutable

part of 'onboard_three_one_bloc.dart';

/// Represents the state of OnboardThreeOne in the application.
class OnboardThreeOneState extends Equatable {
  OnboardThreeOneState({this.onboardThreeOneModelObj});

  OnboardThreeOneModel? onboardThreeOneModelObj;

  @override
  List<Object?> get props => [
        onboardThreeOneModelObj,
      ];

  OnboardThreeOneState copyWith(
      {OnboardThreeOneModel? onboardThreeOneModelObj}) {
    return OnboardThreeOneState(
      onboardThreeOneModelObj:
          onboardThreeOneModelObj ?? this.onboardThreeOneModelObj,
    );
  }
}

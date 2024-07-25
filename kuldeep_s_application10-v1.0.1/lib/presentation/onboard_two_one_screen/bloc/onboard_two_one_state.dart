// ignore_for_file: must_be_immutable

part of 'onboard_two_one_bloc.dart';

/// Represents the state of OnboardTwoOne in the application.
class OnboardTwoOneState extends Equatable {
  OnboardTwoOneState({this.onboardTwoOneModelObj});

  OnboardTwoOneModel? onboardTwoOneModelObj;

  @override
  List<Object?> get props => [
        onboardTwoOneModelObj,
      ];

  OnboardTwoOneState copyWith({OnboardTwoOneModel? onboardTwoOneModelObj}) {
    return OnboardTwoOneState(
      onboardTwoOneModelObj:
          onboardTwoOneModelObj ?? this.onboardTwoOneModelObj,
    );
  }
}

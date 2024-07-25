// ignore_for_file: must_be_immutable

part of 'onboard_one_one_bloc.dart';

/// Represents the state of OnboardOneOne in the application.
class OnboardOneOneState extends Equatable {
  OnboardOneOneState({this.onboardOneOneModelObj});

  OnboardOneOneModel? onboardOneOneModelObj;

  @override
  List<Object?> get props => [
        onboardOneOneModelObj,
      ];

  OnboardOneOneState copyWith({OnboardOneOneModel? onboardOneOneModelObj}) {
    return OnboardOneOneState(
      onboardOneOneModelObj:
          onboardOneOneModelObj ?? this.onboardOneOneModelObj,
    );
  }
}

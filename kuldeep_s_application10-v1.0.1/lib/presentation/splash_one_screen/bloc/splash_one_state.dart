// ignore_for_file: must_be_immutable

part of 'splash_one_bloc.dart';

/// Represents the state of SplashOne in the application.
class SplashOneState extends Equatable {
  SplashOneState({this.splashOneModelObj});

  SplashOneModel? splashOneModelObj;

  @override
  List<Object?> get props => [
        splashOneModelObj,
      ];

  SplashOneState copyWith({SplashOneModel? splashOneModelObj}) {
    return SplashOneState(
      splashOneModelObj: splashOneModelObj ?? this.splashOneModelObj,
    );
  }
}

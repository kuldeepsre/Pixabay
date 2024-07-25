// ignore_for_file: must_be_immutable

part of 'foget_password_bloc.dart';

/// Represents the state of FogetPassword in the application.
class FogetPasswordState extends Equatable {
  FogetPasswordState({
    this.emailController,
    this.fogetPasswordModelObj,
  });

  TextEditingController? emailController;

  FogetPasswordModel? fogetPasswordModelObj;

  @override
  List<Object?> get props => [
        emailController,
        fogetPasswordModelObj,
      ];

  FogetPasswordState copyWith({
    TextEditingController? emailController,
    FogetPasswordModel? fogetPasswordModelObj,
  }) {
    return FogetPasswordState(
      emailController: emailController ?? this.emailController,
      fogetPasswordModelObj:
          fogetPasswordModelObj ?? this.fogetPasswordModelObj,
    );
  }
}

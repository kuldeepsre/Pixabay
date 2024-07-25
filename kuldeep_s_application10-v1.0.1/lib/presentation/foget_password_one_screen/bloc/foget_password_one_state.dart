// ignore_for_file: must_be_immutable

part of 'foget_password_one_bloc.dart';

/// Represents the state of FogetPasswordOne in the application.
class FogetPasswordOneState extends Equatable {
  FogetPasswordOneState({
    this.emailController,
    this.fogetPasswordOneModelObj,
  });

  TextEditingController? emailController;

  FogetPasswordOneModel? fogetPasswordOneModelObj;

  @override
  List<Object?> get props => [
        emailController,
        fogetPasswordOneModelObj,
      ];

  FogetPasswordOneState copyWith({
    TextEditingController? emailController,
    FogetPasswordOneModel? fogetPasswordOneModelObj,
  }) {
    return FogetPasswordOneState(
      emailController: emailController ?? this.emailController,
      fogetPasswordOneModelObj:
          fogetPasswordOneModelObj ?? this.fogetPasswordOneModelObj,
    );
  }
}

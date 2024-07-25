// ignore_for_file: must_be_immutable

part of 'sign_in_one_bloc.dart';

/// Represents the state of SignInOne in the application.
class SignInOneState extends Equatable {
  SignInOneState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.signInOneModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  SignInOneModel? signInOneModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        signInOneModelObj,
      ];

  SignInOneState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    SignInOneModel? signInOneModelObj,
  }) {
    return SignInOneState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signInOneModelObj: signInOneModelObj ?? this.signInOneModelObj,
    );
  }
}

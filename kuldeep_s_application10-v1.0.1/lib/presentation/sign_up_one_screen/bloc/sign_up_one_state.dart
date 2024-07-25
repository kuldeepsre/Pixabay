// ignore_for_file: must_be_immutable

part of 'sign_up_one_bloc.dart';

/// Represents the state of SignUpOne in the application.
class SignUpOneState extends Equatable {
  SignUpOneState({
    this.nameController,
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.signUpOneModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  SignUpOneModel? signUpOneModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        passwordController,
        isShowPassword,
        signUpOneModelObj,
      ];

  SignUpOneState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    SignUpOneModel? signUpOneModelObj,
  }) {
    return SignUpOneState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signUpOneModelObj: signUpOneModelObj ?? this.signUpOneModelObj,
    );
  }
}

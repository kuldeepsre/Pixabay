// ignore_for_file: must_be_immutable

part of 'profile_one_bloc.dart';

/// Represents the state of ProfileOne in the application.
class ProfileOneState extends Equatable {
  ProfileOneState({
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.profileOneModelObj,
  });

  TextEditingController? fullNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  ProfileOneModel? profileOneModelObj;

  @override
  List<Object?> get props => [
        fullNameController,
        emailController,
        passwordController,
        profileOneModelObj,
      ];

  ProfileOneState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    ProfileOneModel? profileOneModelObj,
  }) {
    return ProfileOneState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      profileOneModelObj: profileOneModelObj ?? this.profileOneModelObj,
    );
  }
}

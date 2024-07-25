// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.profileModelObj,
  });

  TextEditingController? fullNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        fullNameController,
        emailController,
        passwordController,
        profileModelObj,
      ];

  ProfileState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}

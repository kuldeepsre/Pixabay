import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kuldeep_s_application10/presentation/sign_in_one_screen/models/sign_in_one_model.dart';part 'sign_in_one_event.dart';part 'sign_in_one_state.dart';/// A bloc that manages the state of a SignInOne according to the event that is dispatched to it.
class SignInOneBloc extends Bloc<SignInOneEvent, SignInOneState> {SignInOneBloc(SignInOneState initialState) : super(initialState) { on<SignInOneInitialEvent>(_onInitialize); on<ChangePasswordVisibilityEvent>(_changePasswordVisibility); }

_changePasswordVisibility(ChangePasswordVisibilityEvent event, Emitter<SignInOneState> emit, ) { emit(state.copyWith(isShowPassword: event.value)); } 
_onInitialize(SignInOneInitialEvent event, Emitter<SignInOneState> emit, ) async  { emit(state.copyWith(emailController: TextEditingController(), passwordController: TextEditingController(), isShowPassword: true)); } 
 }

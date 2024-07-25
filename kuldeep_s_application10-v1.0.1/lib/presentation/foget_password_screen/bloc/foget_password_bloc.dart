import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/foget_password_screen/models/foget_password_model.dart';
part 'foget_password_event.dart';
part 'foget_password_state.dart';

/// A bloc that manages the state of a FogetPassword according to the event that is dispatched to it.
class FogetPasswordBloc extends Bloc<FogetPasswordEvent, FogetPasswordState> {
  FogetPasswordBloc(FogetPasswordState initialState) : super(initialState) {
    on<FogetPasswordInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FogetPasswordInitialEvent event,
    Emitter<FogetPasswordState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
    ));
  }
}

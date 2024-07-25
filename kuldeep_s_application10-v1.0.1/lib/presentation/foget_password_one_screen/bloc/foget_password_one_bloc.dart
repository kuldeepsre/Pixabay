import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/foget_password_one_screen/models/foget_password_one_model.dart';
part 'foget_password_one_event.dart';
part 'foget_password_one_state.dart';

/// A bloc that manages the state of a FogetPasswordOne according to the event that is dispatched to it.
class FogetPasswordOneBloc
    extends Bloc<FogetPasswordOneEvent, FogetPasswordOneState> {
  FogetPasswordOneBloc(FogetPasswordOneState initialState)
      : super(initialState) {
    on<FogetPasswordOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FogetPasswordOneInitialEvent event,
    Emitter<FogetPasswordOneState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
    ));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/checkout_one_dialog/models/checkout_one_model.dart';
part 'checkout_one_event.dart';
part 'checkout_one_state.dart';

/// A bloc that manages the state of a CheckoutOne according to the event that is dispatched to it.
class CheckoutOneBloc extends Bloc<CheckoutOneEvent, CheckoutOneState> {
  CheckoutOneBloc(CheckoutOneState initialState) : super(initialState) {
    on<CheckoutOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CheckoutOneInitialEvent event,
    Emitter<CheckoutOneState> emit,
  ) async {}
}

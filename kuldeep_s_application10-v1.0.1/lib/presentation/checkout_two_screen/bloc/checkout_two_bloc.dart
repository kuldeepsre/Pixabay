import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/checkout_two_screen/models/checkout_two_model.dart';
part 'checkout_two_event.dart';
part 'checkout_two_state.dart';

/// A bloc that manages the state of a CheckoutTwo according to the event that is dispatched to it.
class CheckoutTwoBloc extends Bloc<CheckoutTwoEvent, CheckoutTwoState> {
  CheckoutTwoBloc(CheckoutTwoState initialState) : super(initialState) {
    on<CheckoutTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CheckoutTwoInitialEvent event,
    Emitter<CheckoutTwoState> emit,
  ) async {}
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/checkout_three_screen/models/checkout_three_model.dart';
part 'checkout_three_event.dart';
part 'checkout_three_state.dart';

/// A bloc that manages the state of a CheckoutThree according to the event that is dispatched to it.
class CheckoutThreeBloc extends Bloc<CheckoutThreeEvent, CheckoutThreeState> {
  CheckoutThreeBloc(CheckoutThreeState initialState) : super(initialState) {
    on<CheckoutThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CheckoutThreeInitialEvent event,
    Emitter<CheckoutThreeState> emit,
  ) async {}
}

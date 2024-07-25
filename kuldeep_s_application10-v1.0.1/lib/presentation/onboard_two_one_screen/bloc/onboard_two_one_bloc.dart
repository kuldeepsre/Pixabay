import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/onboard_two_one_screen/models/onboard_two_one_model.dart';
part 'onboard_two_one_event.dart';
part 'onboard_two_one_state.dart';

/// A bloc that manages the state of a OnboardTwoOne according to the event that is dispatched to it.
class OnboardTwoOneBloc extends Bloc<OnboardTwoOneEvent, OnboardTwoOneState> {
  OnboardTwoOneBloc(OnboardTwoOneState initialState) : super(initialState) {
    on<OnboardTwoOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardTwoOneInitialEvent event,
    Emitter<OnboardTwoOneState> emit,
  ) async {}
}

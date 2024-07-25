import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/onboard_three_screen/models/onboard_three_model.dart';
part 'onboard_three_event.dart';
part 'onboard_three_state.dart';

/// A bloc that manages the state of a OnboardThree according to the event that is dispatched to it.
class OnboardThreeBloc extends Bloc<OnboardThreeEvent, OnboardThreeState> {
  OnboardThreeBloc(OnboardThreeState initialState) : super(initialState) {
    on<OnboardThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardThreeInitialEvent event,
    Emitter<OnboardThreeState> emit,
  ) async {}
}

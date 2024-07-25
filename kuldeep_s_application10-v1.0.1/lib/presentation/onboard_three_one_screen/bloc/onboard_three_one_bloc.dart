import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/onboard_three_one_screen/models/onboard_three_one_model.dart';
part 'onboard_three_one_event.dart';
part 'onboard_three_one_state.dart';

/// A bloc that manages the state of a OnboardThreeOne according to the event that is dispatched to it.
class OnboardThreeOneBloc
    extends Bloc<OnboardThreeOneEvent, OnboardThreeOneState> {
  OnboardThreeOneBloc(OnboardThreeOneState initialState) : super(initialState) {
    on<OnboardThreeOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardThreeOneInitialEvent event,
    Emitter<OnboardThreeOneState> emit,
  ) async {}
}

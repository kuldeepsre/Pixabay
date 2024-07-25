import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/onboard_one_one_screen/models/onboard_one_one_model.dart';
part 'onboard_one_one_event.dart';
part 'onboard_one_one_state.dart';

/// A bloc that manages the state of a OnboardOneOne according to the event that is dispatched to it.
class OnboardOneOneBloc extends Bloc<OnboardOneOneEvent, OnboardOneOneState> {
  OnboardOneOneBloc(OnboardOneOneState initialState) : super(initialState) {
    on<OnboardOneOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardOneOneInitialEvent event,
    Emitter<OnboardOneOneState> emit,
  ) async {}
}

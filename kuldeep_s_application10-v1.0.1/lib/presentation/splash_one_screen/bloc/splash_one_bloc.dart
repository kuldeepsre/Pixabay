import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/splash_one_screen/models/splash_one_model.dart';
part 'splash_one_event.dart';
part 'splash_one_state.dart';

/// A bloc that manages the state of a SplashOne according to the event that is dispatched to it.
class SplashOneBloc extends Bloc<SplashOneEvent, SplashOneState> {
  SplashOneBloc(SplashOneState initialState) : super(initialState) {
    on<SplashOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashOneInitialEvent event,
    Emitter<SplashOneState> emit,
  ) async {}
}

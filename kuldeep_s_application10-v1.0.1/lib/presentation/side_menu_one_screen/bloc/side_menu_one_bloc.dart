import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/side_menu_one_screen/models/side_menu_one_model.dart';
part 'side_menu_one_event.dart';
part 'side_menu_one_state.dart';

/// A bloc that manages the state of a SideMenuOne according to the event that is dispatched to it.
class SideMenuOneBloc extends Bloc<SideMenuOneEvent, SideMenuOneState> {
  SideMenuOneBloc(SideMenuOneState initialState) : super(initialState) {
    on<SideMenuOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SideMenuOneInitialEvent event,
    Emitter<SideMenuOneState> emit,
  ) async {}
}

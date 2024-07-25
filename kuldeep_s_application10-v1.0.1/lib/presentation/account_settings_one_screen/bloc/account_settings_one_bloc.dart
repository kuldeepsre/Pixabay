import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kuldeep_s_application10/presentation/account_settings_one_screen/models/account_settings_one_model.dart';
part 'account_settings_one_event.dart';
part 'account_settings_one_state.dart';

/// A bloc that manages the state of a AccountSettingsOne according to the event that is dispatched to it.
class AccountSettingsOneBloc
    extends Bloc<AccountSettingsOneEvent, AccountSettingsOneState> {
  AccountSettingsOneBloc(AccountSettingsOneState initialState)
      : super(initialState) {
    on<AccountSettingsOneInitialEvent>(_onInitialize);
    on<ChangeSwitchEvent>(_changeSwitch);
    on<ChangeSwitch1Event>(_changeSwitch1);
    on<ChangeSwitch2Event>(_changeSwitch2);
    on<ChangeSwitch3Event>(_changeSwitch3);
  }

  _changeSwitch(
    ChangeSwitchEvent event,
    Emitter<AccountSettingsOneState> emit,
  ) {
    emit(state.copyWith(
      isSelectedSwitch: event.value,
    ));
  }

  _changeSwitch1(
    ChangeSwitch1Event event,
    Emitter<AccountSettingsOneState> emit,
  ) {
    emit(state.copyWith(
      isSelectedSwitch1: event.value,
    ));
  }

  _changeSwitch2(
    ChangeSwitch2Event event,
    Emitter<AccountSettingsOneState> emit,
  ) {
    emit(state.copyWith(
      isSelectedSwitch2: event.value,
    ));
  }

  _changeSwitch3(
    ChangeSwitch3Event event,
    Emitter<AccountSettingsOneState> emit,
  ) {
    emit(state.copyWith(
      isSelectedSwitch3: event.value,
    ));
  }

  _onInitialize(
    AccountSettingsOneInitialEvent event,
    Emitter<AccountSettingsOneState> emit,
  ) async {
    emit(state.copyWith(
      isSelectedSwitch: false,
      isSelectedSwitch1: false,
      isSelectedSwitch2: false,
      isSelectedSwitch3: false,
    ));
  }
}

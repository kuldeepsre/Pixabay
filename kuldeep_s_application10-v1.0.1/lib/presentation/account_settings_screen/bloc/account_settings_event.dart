// ignore_for_file: must_be_immutable

part of 'account_settings_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AccountSettings widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountSettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AccountSettings widget is first created.
class AccountSettingsInitialEvent extends AccountSettingsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing switch
class ChangeSwitchEvent extends AccountSettingsEvent {
  ChangeSwitchEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch1Event extends AccountSettingsEvent {
  ChangeSwitch1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch2Event extends AccountSettingsEvent {
  ChangeSwitch2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch3Event extends AccountSettingsEvent {
  ChangeSwitch3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

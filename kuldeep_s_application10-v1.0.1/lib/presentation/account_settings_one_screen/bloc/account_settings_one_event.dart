// ignore_for_file: must_be_immutable

part of 'account_settings_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AccountSettingsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountSettingsOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AccountSettingsOne widget is first created.
class AccountSettingsOneInitialEvent extends AccountSettingsOneEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing switch
class ChangeSwitchEvent extends AccountSettingsOneEvent {
  ChangeSwitchEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch1Event extends AccountSettingsOneEvent {
  ChangeSwitch1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch2Event extends AccountSettingsOneEvent {
  ChangeSwitch2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch3Event extends AccountSettingsOneEvent {
  ChangeSwitch3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

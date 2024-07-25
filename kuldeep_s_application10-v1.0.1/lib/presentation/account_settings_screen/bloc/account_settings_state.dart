// ignore_for_file: must_be_immutable

part of 'account_settings_bloc.dart';

/// Represents the state of AccountSettings in the application.
class AccountSettingsState extends Equatable {
  AccountSettingsState({
    this.isSelectedSwitch = false,
    this.isSelectedSwitch1 = false,
    this.isSelectedSwitch2 = false,
    this.isSelectedSwitch3 = false,
    this.accountSettingsModelObj,
  });

  AccountSettingsModel? accountSettingsModelObj;

  bool isSelectedSwitch;

  bool isSelectedSwitch1;

  bool isSelectedSwitch2;

  bool isSelectedSwitch3;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        isSelectedSwitch1,
        isSelectedSwitch2,
        isSelectedSwitch3,
        accountSettingsModelObj,
      ];

  AccountSettingsState copyWith({
    bool? isSelectedSwitch,
    bool? isSelectedSwitch1,
    bool? isSelectedSwitch2,
    bool? isSelectedSwitch3,
    AccountSettingsModel? accountSettingsModelObj,
  }) {
    return AccountSettingsState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      isSelectedSwitch1: isSelectedSwitch1 ?? this.isSelectedSwitch1,
      isSelectedSwitch2: isSelectedSwitch2 ?? this.isSelectedSwitch2,
      isSelectedSwitch3: isSelectedSwitch3 ?? this.isSelectedSwitch3,
      accountSettingsModelObj:
          accountSettingsModelObj ?? this.accountSettingsModelObj,
    );
  }
}

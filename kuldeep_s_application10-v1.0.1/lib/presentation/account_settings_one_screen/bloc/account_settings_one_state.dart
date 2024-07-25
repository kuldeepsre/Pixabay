// ignore_for_file: must_be_immutable

part of 'account_settings_one_bloc.dart';

/// Represents the state of AccountSettingsOne in the application.
class AccountSettingsOneState extends Equatable {
  AccountSettingsOneState({
    this.isSelectedSwitch = false,
    this.isSelectedSwitch1 = false,
    this.isSelectedSwitch2 = false,
    this.isSelectedSwitch3 = false,
    this.accountSettingsOneModelObj,
  });

  AccountSettingsOneModel? accountSettingsOneModelObj;

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
        accountSettingsOneModelObj,
      ];

  AccountSettingsOneState copyWith({
    bool? isSelectedSwitch,
    bool? isSelectedSwitch1,
    bool? isSelectedSwitch2,
    bool? isSelectedSwitch3,
    AccountSettingsOneModel? accountSettingsOneModelObj,
  }) {
    return AccountSettingsOneState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      isSelectedSwitch1: isSelectedSwitch1 ?? this.isSelectedSwitch1,
      isSelectedSwitch2: isSelectedSwitch2 ?? this.isSelectedSwitch2,
      isSelectedSwitch3: isSelectedSwitch3 ?? this.isSelectedSwitch3,
      accountSettingsOneModelObj:
          accountSettingsOneModelObj ?? this.accountSettingsOneModelObj,
    );
  }
}

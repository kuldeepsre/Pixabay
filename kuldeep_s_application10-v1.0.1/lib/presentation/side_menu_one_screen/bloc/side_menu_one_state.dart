// ignore_for_file: must_be_immutable

part of 'side_menu_one_bloc.dart';

/// Represents the state of SideMenuOne in the application.
class SideMenuOneState extends Equatable {
  SideMenuOneState({this.sideMenuOneModelObj});

  SideMenuOneModel? sideMenuOneModelObj;

  @override
  List<Object?> get props => [
        sideMenuOneModelObj,
      ];

  SideMenuOneState copyWith({SideMenuOneModel? sideMenuOneModelObj}) {
    return SideMenuOneState(
      sideMenuOneModelObj: sideMenuOneModelObj ?? this.sideMenuOneModelObj,
    );
  }
}

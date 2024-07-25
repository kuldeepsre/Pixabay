// ignore_for_file: must_be_immutable

part of 'home_two_bloc.dart';

/// Represents the state of HomeTwo in the application.
class HomeTwoState extends Equatable {
  HomeTwoState({
    this.searchController,
    this.settingsController,
    this.homeTwoModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? settingsController;

  HomeTwoModel? homeTwoModelObj;

  @override
  List<Object?> get props => [
        searchController,
        settingsController,
        homeTwoModelObj,
      ];

  HomeTwoState copyWith({
    TextEditingController? searchController,
    TextEditingController? settingsController,
    HomeTwoModel? homeTwoModelObj,
  }) {
    return HomeTwoState(
      searchController: searchController ?? this.searchController,
      settingsController: settingsController ?? this.settingsController,
      homeTwoModelObj: homeTwoModelObj ?? this.homeTwoModelObj,
    );
  }
}

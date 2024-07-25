// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.settingsController,
    this.homeModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? settingsController;

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [
        searchController,
        settingsController,
        homeModelObj,
      ];

  HomeState copyWith({
    TextEditingController? searchController,
    TextEditingController? settingsController,
    HomeModel? homeModelObj,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      settingsController: settingsController ?? this.settingsController,
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}

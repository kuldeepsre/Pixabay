// ignore_for_file: must_be_immutable

part of 'favourite_bloc.dart';

/// Represents the state of Favourite in the application.
class FavouriteState extends Equatable {
  FavouriteState({this.favouriteModelObj});

  FavouriteModel? favouriteModelObj;

  @override
  List<Object?> get props => [
        favouriteModelObj,
      ];

  FavouriteState copyWith({FavouriteModel? favouriteModelObj}) {
    return FavouriteState(
      favouriteModelObj: favouriteModelObj ?? this.favouriteModelObj,
    );
  }
}

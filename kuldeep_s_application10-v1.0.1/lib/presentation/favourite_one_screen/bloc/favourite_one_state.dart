// ignore_for_file: must_be_immutable

part of 'favourite_one_bloc.dart';

/// Represents the state of FavouriteOne in the application.
class FavouriteOneState extends Equatable {
  FavouriteOneState({this.favouriteOneModelObj});

  FavouriteOneModel? favouriteOneModelObj;

  @override
  List<Object?> get props => [
        favouriteOneModelObj,
      ];

  FavouriteOneState copyWith({FavouriteOneModel? favouriteOneModelObj}) {
    return FavouriteOneState(
      favouriteOneModelObj: favouriteOneModelObj ?? this.favouriteOneModelObj,
    );
  }
}

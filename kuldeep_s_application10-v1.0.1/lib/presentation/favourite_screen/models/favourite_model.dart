// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'favourite_item_model.dart';/// This class defines the variables used in the [favourite_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FavouriteModel extends Equatable {FavouriteModel({this.favouriteItemList = const []}) {  }

List<FavouriteItemModel> favouriteItemList;

FavouriteModel copyWith({List<FavouriteItemModel>? favouriteItemList}) { return FavouriteModel(
favouriteItemList : favouriteItemList ?? this.favouriteItemList,
); } 
@override List<Object?> get props => [favouriteItemList];
 }

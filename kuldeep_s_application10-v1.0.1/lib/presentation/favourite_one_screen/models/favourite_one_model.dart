// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'favouriteone_item_model.dart';/// This class defines the variables used in the [favourite_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FavouriteOneModel extends Equatable {FavouriteOneModel({this.favouriteoneItemList = const []}) {  }

List<FavouriteoneItemModel> favouriteoneItemList;

FavouriteOneModel copyWith({List<FavouriteoneItemModel>? favouriteoneItemList}) { return FavouriteOneModel(
favouriteoneItemList : favouriteoneItemList ?? this.favouriteoneItemList,
); } 
@override List<Object?> get props => [favouriteoneItemList];
 }

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'bestsellerone_item_model.dart';/// This class defines the variables used in the [best_seller_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BestSellerOneModel extends Equatable {BestSellerOneModel({this.bestselleroneItemList = const []}) {  }

List<BestselleroneItemModel> bestselleroneItemList;

BestSellerOneModel copyWith({List<BestselleroneItemModel>? bestselleroneItemList}) { return BestSellerOneModel(
bestselleroneItemList : bestselleroneItemList ?? this.bestselleroneItemList,
); } 
@override List<Object?> get props => [bestselleroneItemList];
 }

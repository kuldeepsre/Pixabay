// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'bestseller_item_model.dart';/// This class defines the variables used in the [best_seller_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BestSellerModel extends Equatable {BestSellerModel({this.bestsellerItemList = const []}) {  }

List<BestsellerItemModel> bestsellerItemList;

BestSellerModel copyWith({List<BestsellerItemModel>? bestsellerItemList}) { return BestSellerModel(
bestsellerItemList : bestsellerItemList ?? this.bestsellerItemList,
); } 
@override List<Object?> get props => [bestsellerItemList];
 }

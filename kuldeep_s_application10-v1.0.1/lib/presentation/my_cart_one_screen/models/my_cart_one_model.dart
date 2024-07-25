// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'mycartone_item_model.dart';/// This class defines the variables used in the [my_cart_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MyCartOneModel extends Equatable {MyCartOneModel({this.mycartoneItemList = const []}) {  }

List<MycartoneItemModel> mycartoneItemList;

MyCartOneModel copyWith({List<MycartoneItemModel>? mycartoneItemList}) { return MyCartOneModel(
mycartoneItemList : mycartoneItemList ?? this.mycartoneItemList,
); } 
@override List<Object?> get props => [mycartoneItemList];
 }

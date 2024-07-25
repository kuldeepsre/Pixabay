// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'hometwo_item_model.dart';/// This class defines the variables used in the [home_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeTwoModel extends Equatable {HomeTwoModel({this.hometwoItemList = const []}) {  }

List<HometwoItemModel> hometwoItemList;

HomeTwoModel copyWith({List<HometwoItemModel>? hometwoItemList}) { return HomeTwoModel(
hometwoItemList : hometwoItemList ?? this.hometwoItemList,
); } 
@override List<Object?> get props => [hometwoItemList];
 }

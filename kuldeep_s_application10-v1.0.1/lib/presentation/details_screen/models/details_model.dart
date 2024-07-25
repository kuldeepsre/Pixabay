// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'frame2_item_model.dart';/// This class defines the variables used in the [details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DetailsModel extends Equatable {DetailsModel({this.frame2ItemList = const []}) {  }

List<Frame2ItemModel> frame2ItemList;

DetailsModel copyWith({List<Frame2ItemModel>? frame2ItemList}) { return DetailsModel(
frame2ItemList : frame2ItemList ?? this.frame2ItemList,
); } 
@override List<Object?> get props => [frame2ItemList];
 }

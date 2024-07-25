// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';/// This class is used in the [frame2_item_widget] screen.
class Frame2ItemModel extends Equatable {Frame2ItemModel({this.widget, this.isSelected, }) { widget = widget  ?? "38";isSelected = isSelected  ?? false; }

String? widget;

bool? isSelected;

Frame2ItemModel copyWith({String? widget, bool? isSelected, }) { return Frame2ItemModel(
widget : widget ?? this.widget,
isSelected : isSelected ?? this.isSelected,
); } 
@override List<Object?> get props => [widget,isSelected];
 }

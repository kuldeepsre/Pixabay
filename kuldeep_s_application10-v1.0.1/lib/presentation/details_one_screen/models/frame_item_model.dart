// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';/// This class is used in the [frame_item_widget] screen.
class FrameItemModel extends Equatable {FrameItemModel({this.widget, this.isSelected, }) { widget = widget  ?? "38";isSelected = isSelected  ?? false; }

String? widget;

bool? isSelected;

FrameItemModel copyWith({String? widget, bool? isSelected, }) { return FrameItemModel(
widget : widget ?? this.widget,
isSelected : isSelected ?? this.isSelected,
); } 
@override List<Object?> get props => [widget,isSelected];
 }

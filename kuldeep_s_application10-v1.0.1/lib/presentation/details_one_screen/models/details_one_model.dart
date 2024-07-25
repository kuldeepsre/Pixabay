// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'detailsone_item_model.dart';import 'frame_item_model.dart';/// This class defines the variables used in the [details_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DetailsOneModel extends Equatable {DetailsOneModel({this.detailsoneItemList = const [], this.frameItemList = const [], }) {  }

List<DetailsoneItemModel> detailsoneItemList;

List<FrameItemModel> frameItemList;

DetailsOneModel copyWith({List<DetailsoneItemModel>? detailsoneItemList, List<FrameItemModel>? frameItemList, }) { return DetailsOneModel(
detailsoneItemList : detailsoneItemList ?? this.detailsoneItemList,
frameItemList : frameItemList ?? this.frameItemList,
); } 
@override List<Object?> get props => [detailsoneItemList,frameItemList];
 }

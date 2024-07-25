// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'today2_item_model.dart';/// This class defines the variables used in the [notifications_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel extends Equatable {NotificationsModel({this.today2ItemList = const []}) {  }

List<Today2ItemModel> today2ItemList;

NotificationsModel copyWith({List<Today2ItemModel>? today2ItemList}) { return NotificationsModel(
today2ItemList : today2ItemList ?? this.today2ItemList,
); } 
@override List<Object?> get props => [today2ItemList];
 }

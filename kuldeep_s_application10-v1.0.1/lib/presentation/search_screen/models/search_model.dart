// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import '../../../core/app_export.dart';import 'search_item_model.dart';/// This class defines the variables used in the [search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchModel extends Equatable {SearchModel({this.searchItemList = const []}) {  }

List<SearchItemModel> searchItemList;

SearchModel copyWith({List<SearchItemModel>? searchItemList}) { return SearchModel(
searchItemList : searchItemList ?? this.searchItemList,
); } 
@override List<Object?> get props => [searchItemList];
 }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/today_item_model.dart';
import 'package:kuldeep_s_application10/presentation/notifications_one_screen/models/notifications_one_model.dart';
part 'notifications_one_event.dart';
part 'notifications_one_state.dart';

/// A bloc that manages the state of a NotificationsOne according to the event that is dispatched to it.
class NotificationsOneBloc
    extends Bloc<NotificationsOneEvent, NotificationsOneState> {
  NotificationsOneBloc(NotificationsOneState initialState)
      : super(initialState) {
    on<NotificationsOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationsOneInitialEvent event,
    Emitter<NotificationsOneState> emit,
  ) async {
    emit(state.copyWith(
        notificationsOneModelObj: state.notificationsOneModelObj?.copyWith(
      todayItemList: fillTodayItemList(),
    )));
  }

  List<TodayItemModel> fillTodayItemList() {
    return [
      TodayItemModel(groupBy: "Today"),
      TodayItemModel(groupBy: "Today"),
      TodayItemModel(groupBy: "Yesterday"),
      TodayItemModel(groupBy: "Yesterday")
    ];
  }
}

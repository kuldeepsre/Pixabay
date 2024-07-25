import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/today2_item_model.dart';
import 'package:kuldeep_s_application10/presentation/notifications_screen/models/notifications_model.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

/// A bloc that manages the state of a Notifications according to the event that is dispatched to it.
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(NotificationsState initialState) : super(initialState) {
    on<NotificationsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationsInitialEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(
        notificationsModelObj: state.notificationsModelObj?.copyWith(
      today2ItemList: fillToday2ItemList(),
    )));
  }

  List<Today2ItemModel> fillToday2ItemList() {
    return [
      Today2ItemModel(groupBy: "Today"),
      Today2ItemModel(groupBy: "Today"),
      Today2ItemModel(groupBy: "Yesterday"),
      Today2ItemModel(groupBy: "Yesterday")
    ];
  }
}

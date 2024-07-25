// ignore_for_file: must_be_immutable

part of 'notifications_one_bloc.dart';

/// Represents the state of NotificationsOne in the application.
class NotificationsOneState extends Equatable {
  NotificationsOneState({this.notificationsOneModelObj});

  NotificationsOneModel? notificationsOneModelObj;

  @override
  List<Object?> get props => [
        notificationsOneModelObj,
      ];

  NotificationsOneState copyWith(
      {NotificationsOneModel? notificationsOneModelObj}) {
    return NotificationsOneState(
      notificationsOneModelObj:
          notificationsOneModelObj ?? this.notificationsOneModelObj,
    );
  }
}

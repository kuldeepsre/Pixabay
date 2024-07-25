// ignore_for_file: must_be_immutable

part of 'notifications_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NotificationsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NotificationsOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the NotificationsOne widget is first created.
class NotificationsOneInitialEvent extends NotificationsOneEvent {
  @override
  List<Object?> get props => [];
}

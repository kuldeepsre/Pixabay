// ignore_for_file: must_be_immutable

part of 'side_menu_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SideMenuOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SideMenuOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SideMenuOne widget is first created.
class SideMenuOneInitialEvent extends SideMenuOneEvent {
  @override
  List<Object?> get props => [];
}

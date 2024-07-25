// ignore_for_file: must_be_immutable

part of 'profile_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ProfileOne widget is first created.
class ProfileOneInitialEvent extends ProfileOneEvent {
  @override
  List<Object?> get props => [];
}

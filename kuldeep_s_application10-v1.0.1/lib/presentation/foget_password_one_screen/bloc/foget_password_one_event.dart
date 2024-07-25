// ignore_for_file: must_be_immutable

part of 'foget_password_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FogetPasswordOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FogetPasswordOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the FogetPasswordOne widget is first created.
class FogetPasswordOneInitialEvent extends FogetPasswordOneEvent {
  @override
  List<Object?> get props => [];
}

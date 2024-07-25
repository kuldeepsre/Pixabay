// ignore_for_file: must_be_immutable

part of 'foget_password_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FogetPassword widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FogetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the FogetPassword widget is first created.
class FogetPasswordInitialEvent extends FogetPasswordEvent {
  @override
  List<Object?> get props => [];
}

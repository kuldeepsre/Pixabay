// ignore_for_file: must_be_immutable

part of 'checkout_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CheckoutTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CheckoutTwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the CheckoutTwo widget is first created.
class CheckoutTwoInitialEvent extends CheckoutTwoEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'checkout_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CheckoutThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CheckoutThreeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the CheckoutThree widget is first created.
class CheckoutThreeInitialEvent extends CheckoutThreeEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'my_cart_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MyCartOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MyCartOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the MyCartOne widget is first created.
class MyCartOneInitialEvent extends MyCartOneEvent {
  @override
  List<Object?> get props => [];
}

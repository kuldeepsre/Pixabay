// ignore_for_file: must_be_immutable

part of 'best_seller_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///BestSeller widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BestSellerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the BestSeller widget is first created.
class BestSellerInitialEvent extends BestSellerEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'best_seller_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///BestSellerOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BestSellerOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the BestSellerOne widget is first created.
class BestSellerOneInitialEvent extends BestSellerOneEvent {
  @override
  List<Object?> get props => [];
}

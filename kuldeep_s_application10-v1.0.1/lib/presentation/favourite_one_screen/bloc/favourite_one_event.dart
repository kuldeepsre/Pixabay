// ignore_for_file: must_be_immutable

part of 'favourite_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FavouriteOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FavouriteOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the FavouriteOne widget is first created.
class FavouriteOneInitialEvent extends FavouriteOneEvent {
  @override
  List<Object?> get props => [];
}

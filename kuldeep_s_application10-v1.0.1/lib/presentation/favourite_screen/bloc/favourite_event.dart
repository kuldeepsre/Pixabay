// ignore_for_file: must_be_immutable

part of 'favourite_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Favourite widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FavouriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Favourite widget is first created.
class FavouriteInitialEvent extends FavouriteEvent {
  @override
  List<Object?> get props => [];
}

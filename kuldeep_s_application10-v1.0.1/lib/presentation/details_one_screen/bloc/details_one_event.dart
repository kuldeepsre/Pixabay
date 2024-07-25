// ignore_for_file: must_be_immutable

part of 'details_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DetailsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DetailsOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DetailsOne widget is first created.
class DetailsOneInitialEvent extends DetailsOneEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends DetailsOneEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
  });

  int index;

  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
      ];
}

part of 'pagination_bloc.dart';

abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends PaginationEvent {
  final int page;

  FetchData(this.page);

  @override
  List<Object> get props => [page];
}

class FetchNextPage extends PaginationEvent {}

class FetchPreviousPage extends PaginationEvent {}
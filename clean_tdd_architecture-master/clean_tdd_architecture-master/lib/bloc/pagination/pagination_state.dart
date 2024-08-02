part of 'pagination_bloc.dart';

// States
abstract class PaginationState extends Equatable {
  const PaginationState();

  @override
  List<Object> get props => [];
}

class PaginationInitial extends PaginationState {}

class PaginationLoading extends PaginationState {}

class PaginationLoaded extends PaginationState {
  final List<Map<String, dynamic>> data;
  final int currentPage;
  final int totalPages;

  PaginationLoaded(this.data, this.currentPage, this.totalPages);

  @override
  List<Object> get props => [data, currentPage, totalPages];
}

class PaginationError extends PaginationState {
  final String message;

  PaginationError(this.message);

  @override
  List<Object> get props => [message];
}

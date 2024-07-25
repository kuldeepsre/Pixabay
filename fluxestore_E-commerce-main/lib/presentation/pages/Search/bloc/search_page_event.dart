part of 'search_page_bloc.dart';

@immutable
sealed class SearchPageEvent {}

class SearchPageInitialEvent extends SearchPageEvent {}

class SearchPageOnSearchEvent extends SearchPageEvent {
  final String query;

  SearchPageOnSearchEvent({required this.query});
}

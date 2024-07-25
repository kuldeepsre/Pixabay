part of 'search_page_bloc.dart';

@immutable
sealed class SearchPageState {}

final class SearchPageInitial extends SearchPageState {}

abstract class SearchPageActionState extends SearchPageState {}

class SearchPageShowCaseState extends SearchPageState{}

class SearchLoadingState extends SearchPageState {}

class SearchLoadedSucessstate extends SearchPageState {
 final List<ProductDataModel> responseItems;

  SearchLoadedSucessstate({required this.responseItems});
}

class SearchPageNoResponseState extends SearchPageState{}

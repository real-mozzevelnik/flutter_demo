part of 'search_bloc.dart';

class SearchState {
  String searchText = "";
}

class SearchSearchingState extends SearchState {
  SearchSearchingState({
    required String text
  }) {
    super.searchText = text;
  }
}

class SearchLoadingState extends SearchState {
  SearchLoadingState({
    required String text
  }) {
    super.searchText = text;
  }
}

class SearchEmptyState extends SearchState {}

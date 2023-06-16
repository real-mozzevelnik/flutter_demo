part of 'search_bloc.dart';

class SearchEvent {
  String searchText = "";
}

class SearchSearchingEvent extends SearchEvent {
  SearchSearchingEvent({
    required String text
  }) {
    super.searchText = text;
  }
}

class SearchLoadingEvent extends SearchEvent {
  SearchLoadingEvent({
    required String text
  }) {
    super.searchText = text;
  }
}
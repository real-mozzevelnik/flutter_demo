part of 'search_bloc.dart';

class SearchEvent {
  String searchText = "";
}

class SearchLoadedEvent extends SearchEvent {
  SearchLoadedEvent({
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
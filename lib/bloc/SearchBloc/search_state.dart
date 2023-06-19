part of 'search_bloc.dart';

class SearchState {
  String searchText = "";
  List<String> img_urls = [];
}

class SearchLoadedState extends SearchState {
  SearchLoadedState({
    required String text,
    required List<String> img_urls
  }) {
    super.searchText = text;
    super.img_urls = img_urls;
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

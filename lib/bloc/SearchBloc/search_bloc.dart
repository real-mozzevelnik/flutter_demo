import 'package:bloc/bloc.dart';

import 'package:untitled1/Services/SearchService.dart';

part 'search_event.dart';
part 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchEmptyState()) {
    on<SearchLoadingEvent>(_onSearchLoadingEvent);
  }

  void _onSearchLoadingEvent(SearchEvent event, emit) async {

    if (event.searchText == "") {
      emit(SearchEmptyState());
      return;
    }

    emit(SearchLoadingState(
        text: event.searchText));

    List<String> img_urls = await SearchService.getData(event.searchText);

    emit(SearchLoadedState(
        text: event.searchText,
        img_urls: img_urls
    ));
  }
}

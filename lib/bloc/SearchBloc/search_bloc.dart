import 'package:bloc/bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchEmptyState()) {
    on<SearchSearchingEvent>((event, emit) {
      return emit(SearchSearchingState(
          text: event.searchText
      )
      );
    });
    on<SearchLoadingEvent>((event, emit) {
      return emit(SearchLoadingState(
          text: event.searchText
      ));
    });
  }
}

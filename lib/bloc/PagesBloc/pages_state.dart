import 'package:meta/meta.dart';

enum Pages {
  HOME_PAGE,
  SEARCH_PAGE
}

Map<Pages, String> PagesTitles = {
  Pages.HOME_PAGE : "Home",
  Pages.SEARCH_PAGE : "Search"
};

sealed class PagesState {
  Pages page = Pages.HOME_PAGE;
}

final class StateHome extends PagesState {
  StateHome() {
    super.page = Pages.HOME_PAGE;
  }
}

final class StateSearch extends PagesState {
  StateSearch() {
    super.page = Pages.SEARCH_PAGE;
  }
}



import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/bloc/NavigationBarBloc/navigation_bar_event.dart';
import 'package:untitled1/bloc/NavigationBarBloc/navigation_bar_state.dart';


class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(NavigationBarActiveState()) {
    on<NavigationBarActiveEvent>((event, emit) {
      return emit(NavigationBarActiveState());
    });
    on<NavigationBarInactiveEvent>((event, emit) {
      return emit(NavigationBarInactiveState());
    });
  }
}

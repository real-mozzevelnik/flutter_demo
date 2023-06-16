import 'package:bloc/bloc.dart';

import 'package:untitled1/bloc/PagesBloc/PagesEvents.dart';
import 'package:untitled1/bloc/PagesBloc/PagesStates.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesBloc() : super(StateHome()) {
    on<EventHome>((event, emit) => emit(StateHome()));
    on<EventSearch>((event, emit) => emit(StateSearch()));
  }
}
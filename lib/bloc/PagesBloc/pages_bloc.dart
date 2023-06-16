import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/PagesBloc/pages_event.dart';
import 'package:untitled1/bloc/PagesBloc/pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesBloc() : super(StateHome()) {
    on<EventHome>((event, emit) => emit(StateHome()));
    on<EventSearch>((event, emit) => emit(StateSearch()));
  }
}
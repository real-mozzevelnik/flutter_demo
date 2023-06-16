import 'package:meta/meta.dart';

@immutable
sealed class PagesState {}

final class StateHome extends PagesState {}
final class StateSearch extends PagesState {}

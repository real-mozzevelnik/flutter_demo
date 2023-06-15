import 'package:meta/meta.dart';

@immutable
sealed class PagesEvent {}

final class EventHome extends PagesEvent {}
final class EventSearch extends PagesEvent {}
import 'package:flutter/cupertino.dart';

@immutable
abstract class NavigationBarEvent {}

class NavigationBarActiveEvent extends NavigationBarEvent {}
class NavigationBarInactiveEvent extends NavigationBarEvent {}

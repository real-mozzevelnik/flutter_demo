import 'package:flutter/cupertino.dart';

@immutable
abstract class NavigationBarState {}

class NavigationBarActiveState extends NavigationBarState {}
class NavigationBarInactiveState extends NavigationBarState {}

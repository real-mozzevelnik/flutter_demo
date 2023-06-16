import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/bloc/PagesBloc/pages_event.dart';
import 'package:untitled1/bloc/PagesBloc/pages_bloc.dart';
import 'package:untitled1/bloc/PagesBloc/pages_state.dart';

class NavigationBarMenu extends StatefulWidget {
  const NavigationBarMenu({super.key});

  @override
  State<NavigationBarMenu> createState() => NavigationBarMenuState();
}

class NavigationBarMenuState extends State<NavigationBarMenu> {
  int cur_index = 0;

  final _events = <PagesEvent>[EventHome(), EventSearch()];

  void onTap(index) {
    cur_index = index;
    context.read<PagesBloc>().add(_events[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: Colors.deepPurple,
            iconSize: 28.0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home_outlined
                  ),
                  label: "Home",
                  activeIcon: Icon(
                      Icons.home
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                  label: "Search",
                  activeIcon: Icon(
                      Icons.search
                  )
              )
            ],
            onTap: onTap,
            currentIndex: cur_index,
          );

        }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/Pages/Home/HomePage.dart';
import 'package:untitled1/bloc/NavigationBarBloc/navigation_bar_bloc.dart';
import 'package:untitled1/bloc/NavigationBarBloc/navigation_bar_state.dart';
import 'package:untitled1/bloc/PagesBloc/pages_bloc.dart';
import 'package:untitled1/bloc/PagesBloc/pages_state.dart';
import 'package:untitled1/Widgets/NavigationBarMenu.dart';




class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.deepPurple
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "Home",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<NavigationBarBloc, NavigationBarState>(
            builder: (context, state) {
              return state is NavigationBarActiveState ? const NavigationBarMenu() : Container();
            },
          ),
          body: BlocBuilder<PagesBloc, PagesState>(
              builder: (context, state) {
                switch (state) {
                  case (StateHome()):
                    return const HomePage();
                  case (StateSearch()):
                    return const Material();
                }
              }
          ),
        )
    );
  }
}





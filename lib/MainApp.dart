import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/Pages/Home/HomePage.dart';
import 'package:untitled1/bloc/PagesBloc/PagesBloc.dart';
import 'package:untitled1/bloc/PagesBloc/PagesStates.dart';



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
        home: BlocBuilder<PagesBloc, PagesState>(
            builder: (context, state) {
              switch (state) {
                case (StateHome()):
                  return const HomePage();
                case (StateSearch()):
                  return const Material();
              }
            }
        ),
    );
  }
}
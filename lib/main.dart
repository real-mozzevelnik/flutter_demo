import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/NavigationBarBloc/navigation_bar_bloc.dart';
import 'package:untitled1/bloc/PagesBloc/pages_bloc.dart';
import 'package:untitled1/bloc/SearchBloc/search_bloc.dart';

import 'package:untitled1/MainApp.dart';

void main() => runApp(
  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PagesBloc(),
        ),
        BlocProvider(
            create: (BuildContext context) => NavigationBarBloc()
        ),
        BlocProvider(
            create: (BuildContext context) => SearchBloc()
        )
      ],
      child: const MainApp()
  )
);
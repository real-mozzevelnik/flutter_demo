import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/PagesBloc.dart';

import 'package:untitled1/MainApp.dart';

void main() => runApp(
  BlocProvider(
      create: (context) => PagesBloc(),
      child: const MainApp()
  )
);
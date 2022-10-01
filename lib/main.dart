import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:practica_1/Home/songs/bloc/favorites_bloc.dart';

import 'Home/bloc/escuchar_bloc.dart';
import 'Home/fav_songs/bloc/favorites_bloc.dart';
import 'Home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => EscucharBloc(),
    ),
    BlocProvider(
      create: (context) => FavoritesBloc(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_movie_example/view/movie_view.dart';
import 'package:mvvm_movie_example/view_model/movie_view_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MovieViewModel(),
      child: MaterialApp(
        title: 'movie demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MovieView(),
      ),
    );
  }
}

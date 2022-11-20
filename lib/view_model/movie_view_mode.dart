import 'package:flutter/cupertino.dart';
import 'package:mvvm_movie_example/service/web_service.dart';

import '../model/movie.dart';

enum MovieState { IDLE, BUSY, ERROR }

class MovieViewModel with ChangeNotifier {
  MovieState _state = MovieState.BUSY;

  List<Movie>? movieList;

  MovieViewModel() {
    movieList = [];
    _state = MovieState.IDLE;
    searchMovie();
  }

  MovieState get state => _state;

  set state(MovieState state) {
    _state = state;

    notifyListeners();
  }

  Future<List<Movie>?> searchMovie() async {
    try {
      state = MovieState.BUSY;
      //await Future.delayed(Duration(seconds: 10));
      movieList = await WebService().searchMovie();
      state = MovieState.IDLE;
      return movieList;
    } catch (e) {
      state = MovieState.ERROR;
      return <Movie>[];
    }
  }
}

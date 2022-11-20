import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_movie_example/constant/application_constants.dart';
import 'package:mvvm_movie_example/model/movie.dart';
import 'package:mvvm_movie_example/model/searchResult.dart';

class WebService {
  Future<List<Movie>> searchMovie() async {
    final response = await http.get(Uri.parse(ApplicationConstant.API_URL));

    if (response.statusCode == 200) {
      return searchFromJson(response.body).movies;
    }
    return <Movie>[];
  }
}

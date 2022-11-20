// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

class Movie {
  Movie({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.poster,
  });

  String title;
  String year;
  String imdbId;
  String poster;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Poster": poster,
      };
}

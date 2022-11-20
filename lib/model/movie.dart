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
  Type type;
  String poster;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
      };
}

enum Type { MOVIE, SERIES }

final typeValues = EnumValues({"movie": Type.MOVIE, "series": Type.SERIES});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

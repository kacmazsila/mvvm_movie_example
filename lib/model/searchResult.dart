import 'dart:convert';

import 'movie.dart';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    required this.movies,
    required this.totalResults,
    required this.response,
  });

  List<Movie> movies;
  String totalResults;
  String response;

  factory Search.fromJson(Map<String, dynamic> json) => Movie(
        search: List<Movie>.from(
            json["Search"].map((x) => SearchElement.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

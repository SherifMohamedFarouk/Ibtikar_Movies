import 'dart:convert';

import 'package:ibtikar_movies/model/popular/popular_result.dart';


PopularModel popularModelFromJson(String str) => PopularModel.fromJson(json.decode(str));

String popularModelToJson(PopularModel data) => json.encode(data.toJson());

class PopularModel {
  PopularModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}


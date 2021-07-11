import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibtikar_movies/model/popular/popular_model.dart';


class PopularServices{
  int page ;
  PopularServices({@required this.page});
  static var client =http.Client();

static Future<PopularModel> fetchPopular(page ) async{
 var url= Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=df3b5f4967782c690e9e21861634f917&language=en-US&page=${page.toString()}");
 var response = await client.get(url);
 if (response.statusCode == 200) {
   var jsonString = response.body;
   return popularModelFromJson(jsonString);
 }
}

}

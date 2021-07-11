import 'package:flutter/material.dart';
import 'package:ibtikar_movies/model/images/images_model.dart';
import 'package:http/http.dart' as http;

class ImagesServices{
  int personId ;
  ImagesServices({@required this.personId});
  static var client =http.Client();

  static Future<ImagesModel> fetchImages(personId ) async{
  var url= Uri.parse("https://api.themoviedb.org/3/person/${personId.toString()}/images?api_key=df3b5f4967782c690e9e21861634f917");
  var response = await client.get(url);
  if (response.statusCode == 200) {
  var jsonString = response.body;
  return imagesModelFromJson(jsonString);
  }
  }

  }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibtikar_movies/config/palette.dart';

class ImagesWidgets extends StatelessWidget {
  final String images;
  const ImagesWidgets({Key key,@required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Palette.black,
            ),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child:  CachedNetworkImage(
                imageUrl: "https://www.themoviedb.org/t/p/original${images}",
                fit: BoxFit.cover,

              ),
            ),
          )),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibtikar_movies/config/palette.dart';

class PopularWidgets extends StatelessWidget {
  final String personImage;
  final String personName;
  final String personKnownFor;
  final int personId;
  final int page;
  final int gender;

  const PopularWidgets({
    Key key,
    @required this.personImage,
    @required this.personName,
    @required this.personKnownFor,
    @required this.personId,
    @required this.gender,
    @required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {

    },
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: personImage,
                    fit: BoxFit.cover,
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    personName,
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BigImageScreen extends StatelessWidget {
  final String image;

  BigImageScreen({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height ,
        width:MediaQuery.of(context).size.width ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
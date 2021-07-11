import 'package:flutter/material.dart';
import 'package:ibtikar_movies/config/palette.dart';

class InfoWidget extends StatelessWidget {
  final String name;
  final String knownFor;
  final int gender;
  const InfoWidget({Key key,@required this.name, @required this.knownFor, @required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Palette.darkBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("  Name : $name",style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Palette.white
          ),),
          const SizedBox(height: 2.0,),
          Text("  Known for : $knownFor",style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Palette.white
          ),),
          const SizedBox(height: 2.0,),
          Text("  Gender :   ${gender == 1 ? "Female":"Male"} ",style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Palette.white
          ),),
        ],
      ),
    );
  }

}

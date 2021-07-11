
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibtikar_movies/config/palette.dart';
import 'package:ibtikar_movies/getx_controllers/get_controllers.dart';
import 'package:ibtikar_movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final GetControllers screenControllers = Get.put(GetControllers());
  final String personName;
  final String personKnownFor;
  final int gender;


  DetailsScreen({
    Key key,
    @required this.personName,
    @required this.personKnownFor,
    @required this.gender
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        title: appBarTittle(),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            child: Column(
              children: [
                InfoWidget(name:personName,knownFor:personKnownFor,gender:gender),
               Obx(() {
                    return screenControllers.isImagesLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : _gridImages();
                  }),

              ],
            ),
          ),
        ),
      ),
    );
  }


  GridView _gridImages() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        screenControllers.personImages.length,
        (index) {
          final images = screenControllers.personImages[index];
          return ImagesWidgets(images: images.filePath);
        },
      ),
    );
  }
}

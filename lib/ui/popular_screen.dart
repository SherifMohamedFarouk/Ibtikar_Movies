import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibtikar_movies/config/palette.dart';
import 'package:ibtikar_movies/getx_controllers/get_controllers.dart';
import 'package:ibtikar_movies/widgets/widgets.dart';

class PopularScreen extends StatelessWidget {
  final GetControllers screenControllers = Get.put(GetControllers());
  var page;

  PopularScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        title: appBarTittle(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Obx(() {
            return screenControllers.isPopularLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                controller: screenControllers.scrollController.value,
                itemCount: screenControllers.popularList.length,
                itemBuilder: (context, index) {
                  final note = screenControllers.popularList[index];
                  return PopularWidgets(
                      personImage:
                      "https://www.themoviedb.org/t/p/original${note.profilePath}",
                      personName: note.name,
                      personKnownFor: screenControllers.known.value,
                      personId: note.id,
                      gender: note.gender,
                      page: page);
                });
          }),
        ),
      ),
    );
  }
}

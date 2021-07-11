
import 'package:get/get.dart';
import 'package:ibtikar_movies/model/popular/popular_result.dart';
import 'package:ibtikar_movies/services/popular_services.dart';
import 'package:logger/logger.dart';

class GetControllers extends GetxController {
  var isPopularLoading = false.obs;
  var popularList = <Result>[].obs;
  var page = 1.obs;
  var known = "Acting".obs;

  @override
  void onInit() {
    fetchPopular(1);
  }

  fetchPopular(int page) async {
    var logger = Logger();
    isPopularLoading(true);
    var products = await PopularServices.fetchPopular(page);
    if (products != null) {
      popularList.value = products.results;
      logger.d(popularList.length);
      isPopularLoading(false);
    }

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

}
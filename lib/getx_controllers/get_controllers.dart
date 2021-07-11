
import 'package:get/get.dart';
import 'package:ibtikar_movies/model/popular/popular_result.dart';
import 'package:ibtikar_movies/repositories/popular_repository.dart';
import 'package:ibtikar_movies/services/popular_services.dart';
import 'package:logger/logger.dart';

class GetControllers extends GetxController {
  var isPopularLoading = false.obs;
  var popularList = <Result>[].obs;
  var page = 1.obs;
  var known = "Acting".obs;

  PostRepository _postRepository = PostRepository();
  @override
  void onInit() {
    fetchPopular(1);
  }

  fetchPopular(int page) async {
    isPopularLoading(true);
    _postRepository.fetchResults(page);
    popularList.addAll(await _postRepository.fetchResults(page));
    isPopularLoading(false);
  }

  addPopularList(){

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

}
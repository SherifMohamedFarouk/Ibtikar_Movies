
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibtikar_movies/model/images/images_model.dart';
import 'package:ibtikar_movies/model/popular/popular_result.dart';
import 'package:ibtikar_movies/repositories/popular_repository.dart';
import 'package:ibtikar_movies/services/images_services.dart';
import 'package:ibtikar_movies/services/popular_services.dart';
import 'package:logger/logger.dart';

class GetControllers extends GetxController {
  var isPopularLoading = false.obs;
  var isImagesLoading = false.obs;
  var popularList = <Result>[].obs;
  var personImages = <Profile>[].obs;
  var page = 1.obs;
  var known = "Acting".obs;
  var scrollController = ScrollController().obs;

  PostRepository _postRepository = PostRepository();
  @override
  void onInit() {
    fetchPopular(1);
    addPopularList(page.value);
  }

  fetchPopular(int page) async {
    isPopularLoading(true);
    _postRepository.fetchResults(page);
    popularList.addAll(await _postRepository.fetchResults(page));
    isPopularLoading(false);
  }

  addPopularList(int page) async{
    scrollController.value.addListener(() {
      if(scrollController.value.position.pixels == scrollController.value.position.maxScrollExtent){
        page++;
        addPopular(page);
      }
    });
  }

  addPopular(int page) async {
    var products = await _postRepository.fetchResults(page);
    if (products != null) {
      popularList.addAll(products);
    }

  }

  fetchImages(int personId) async {
    var logger = Logger();
    isImagesLoading(true);
    var products = await ImagesServices.fetchImages(personId);
    logger.d(personId.toString());
    if (products != null) {
      personImages.value =products.profiles ;
      logger.d(personImages.value.length.toString());
      isImagesLoading(false);
    }
  }

  @override
  void onClose() {
 scrollController.value.dispose();
  }

  @override
  void onReady() {

  }

}
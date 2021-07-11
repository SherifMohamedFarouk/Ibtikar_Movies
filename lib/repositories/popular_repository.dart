import 'package:connectivity/connectivity.dart';
import 'package:ibtikar_movies/db/db_helper.dart';
import 'package:ibtikar_movies/model/popular/popular_result.dart';
import 'package:ibtikar_movies/services/popular_services.dart';


class PostRepository{
  var dbpage = 1;
  // check if there a network, if not return saved results from data base
  Future<List<Result>> fetchResults(int page) async{
    // get the network status
    var connectivityResult = await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;
    // if there is not a network, return saved posts in db
    if(connectivityResult == ConnectivityResult.none){
      final savedPosts = await dbHelper.queryAllRows();
      return List<Result>.from(savedPosts.map((savedPost) => Result.fromJson(savedPost)));
    } else{
      var products = await PopularServices.fetchPopular(page);
      if (dbpage == page) {
        for (final result in products.results) {
          dbHelper.insert(result.toMap());
        }
        dbpage++;
      }
      return products.results;
    }
  }
}


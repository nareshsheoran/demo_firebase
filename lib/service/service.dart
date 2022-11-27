import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:demo_firebase/model/news_item.dart';
import 'package:demo_firebase/service/news_firebase_service.dart';

class NewsService {
  StreamSubscription? subscription;
  bool isNetConnected = true;

  NewsService._internal() {
    init();
  }

  static final NewsService _newsService = NewsService._internal();

  factory NewsService() {
    return _newsService;
  }

  List<NewsItem> newsItemList = [];

  void init() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        isNetConnected = true;
      } else {
        isNetConnected = false;
      }
    });
  }

  Future<List<NewsItem>> fetchNewsByPagination() async {
    if (isNetConnected) {
      newsItemList.clear();
      List<NewsItem> itemList =
          await NewsFirebaseService().fetchNewsByPagination();
      newsItemList.addAll(itemList);
      print("lenn: ${newsItemList.length}");
      return newsItemList;
    } else {
      // Fluttertoast.showToast("Internet not available");
    }
    return newsItemList;
  }

// Future removeNewsItem(NewsItem newsItem) async{
//   return await NewsFirebaseService().removeNewsItem(newsItem);
// }
}

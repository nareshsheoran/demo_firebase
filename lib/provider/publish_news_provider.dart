import 'package:demo_firebase/model/news_item.dart';
import 'package:demo_firebase/service/news_firebase_service.dart';
import 'package:flutter/material.dart';

class PublishNewsProvider extends ChangeNotifier {
  Future postNews(NewsItem newsItem) async {
   await NewsFirebaseService().postNews(newsItem);
   print('News Published!');

    // AppUtils.showToast("News Published!");
  }
}

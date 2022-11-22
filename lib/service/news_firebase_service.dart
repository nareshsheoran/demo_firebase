// ignore_for_file: prefer_final_fields

import 'package:demo_firebase/model/news_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class NewsFirebaseService {
  NewsFirebaseService._internal();

  static NewsFirebaseService _newsService =
  NewsFirebaseService._internal();

  factory NewsFirebaseService() {
    return _newsService;
  }
  QueryDocumentSnapshot? last;


  Future postNews(NewsItem newsItem) async {
    String id = const Uuid().v1();
    newsItem.id = id;
    await FirebaseFirestore.instance
        .collection("news")
        .doc(id)
        .set(newsItem.toJson());
    print('added successfully !');
  }

  Future<List<NewsItem>> fetchNewsByPagination() async {
    List<NewsItem> newsItemList = [];
    newsItemList.clear();
    CollectionReference newsRef = FirebaseFirestore.instance.collection("news");
    QuerySnapshot data;

    if (last == null) {
      data = await newsRef.orderBy('date').limit(5).get();
    } else {
      data = await newsRef
          .orderBy("date", descending: false)
          .limit(3)
          .startAfterDocument(last!)
          .get();
    }
    if (data != null && data.docs.length > 0) {
      last = data.docs[data.docs.length - 1];
      data.docs.forEach((element) {
        if (element.exists) {
          newsItemList
              .add(NewsItem.fromJson(element.data() as Map<String, dynamic>));
        }
      });
    }

    return newsItemList;
  }

}

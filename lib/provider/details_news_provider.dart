
import 'package:demo_firebase/model/news_item.dart';
import 'package:demo_firebase/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailsNewsProvider extends ChangeNotifier {
  List<NewsItem> newsItemList = [];
  bool isLoading = false;

  DetailsNewsProvider() {
    fetchNewsByPagination();
  }


  Future fetchNewsByPagination() async {
    isLoading = true;
    notifyListeners();
    newsItemList = await NewsService().fetchNewsByPagination();
    isLoading = false;
    notifyListeners();
  }

  void onRefresh(RefreshController refreshController) async {
    await fetchNewsByPagination();
    refreshController.refreshCompleted();
  }

  // Future onDismiss(int index) async {
  //   bool isDeleted = await NewsService().removeNewsItem(newsItemList[index]);
  //   if (isDeleted) {
  //     newsItemList.removeAt(index);
  //     notifyListeners();
  //   }
  // }
}

// ignore_for_file: prefer_const_constructors

import 'package:demo_firebase/page/news_details_page.dart';
import 'package:demo_firebase/provider/details_news_provider.dart';
import 'package:demo_firebase/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShowNewsWidget extends StatefulWidget {
  const ShowNewsWidget({Key? key}) : super(key: key);

  @override
  State<ShowNewsWidget> createState() => _ShowNewsWidgetState();
}

class _ShowNewsWidgetState extends State<ShowNewsWidget> {
  DetailsNewsProvider? _detailsNewsProvider;

  RefreshController? _refreshController;

  @override
  void initState() {
    _detailsNewsProvider = DetailsNewsProvider();
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsNewsProvider>(
      builder: (context, provider, child) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SmartRefresher(
              controller: _refreshController!,
              onRefresh: () {
                provider.onRefresh(_refreshController!);
              },
              child: ListView.builder(
                  itemCount: provider.newsItemList.length,
                  itemBuilder: (context, index) {
                    print("ee:${provider.newsItemList.length}");
                    return Container(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(
                              context, AppRoutes.NewsDetailsPage,
                              arguments: provider.newsItemList[index]);

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.newsItemList[index].title!,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "${provider.newsItemList[index].detail}",maxLines: 2,
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              flex: 1,
                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYaQE2_T9cdK8PauC6EUySqnrZ0Wtb6xzm3g&usqp=CAU",
                                      fit: BoxFit.fitHeight,
                                      errorBuilder: (ctx, obj, stack) {
                                        return Container(
                                            child: Image.asset(
                                          "assets/images/placeholder.png",
                                          fit: BoxFit.fitHeight,
                                        ));
                                      },
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ));
      },
      // ),
    );
  }
}

import 'package:demo_firebase/model/news_item.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatefulWidget {
  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  NewsItem? _newsItem;

  @override
  Widget build(BuildContext context) {
    _newsItem = ModalRoute.of(context)?.settings.arguments as NewsItem;

    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_newsItem!.title!,
                style: Theme.of(context).textTheme.headline6),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_newsItem!.detail!,
                style: Theme.of(context).textTheme.headline6),
          )
        ],
      )),
    );
  }
}

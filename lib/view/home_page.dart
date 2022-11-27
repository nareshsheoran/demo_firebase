// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_firebase/provider/details_news_provider.dart';
import 'package:demo_firebase/provider/publish_news_provider.dart';
import 'package:demo_firebase/widget/post_news_widget.dart';
import 'package:demo_firebase/widget/show_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late final PublishNewsProvider? _provider;
  final DetailsNewsProvider _detailsProvider = DetailsNewsProvider();

  iniState(){
    super.initState();
    _provider!=PublishNewsProvider();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailsNewsProvider>(
        create: (context) => _detailsProvider,
        builder: (context, child) {
          return Consumer<DetailsNewsProvider>(
              builder: (context, provider, child) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("News"),
                  centerTitle: true,
                  bottom: TabBar(
                    // indicatorColor: Constant.primaryColor,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: "Show"),
                      Tab(text: "Post"),
                    ],
                  ),
                ),
                key: _scaffoldKey,
                body: TabBarView(
                  children: [
                    ShowNewsWidget(),
                    PostNewsWidget(),
                  ],
                ),
              ),
            );
          });
        });
  }
}

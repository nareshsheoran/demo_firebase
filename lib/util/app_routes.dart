import 'package:demo_firebase/page/news_details_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String NewsDetailsPage = "NewsDetailsPage";
 }

Map<String, WidgetBuilder> routes = {
  AppRoutes.NewsDetailsPage: (context) => NewsDetailsPage(),
 };

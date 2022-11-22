// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:demo_firebase/model/news_item.dart';
import 'package:demo_firebase/provider/publish_news_provider.dart';
import 'package:demo_firebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostNewsWidget extends StatefulWidget {
  const PostNewsWidget({Key? key}) : super(key: key);

  @override
  State<PostNewsWidget> createState() => _PostNewsWidgetState();
}

class _PostNewsWidgetState extends State<PostNewsWidget> {
  TextEditingController titleController =
      TextEditingController(text: "News Title");
  TextEditingController detailController =
      TextEditingController(text: "News Detail");
  final _formKey = GlobalKey<ScaffoldState>();
  final PublishNewsProvider _provider = PublishNewsProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PublishNewsProvider>(
        create: (ctx) => PublishNewsProvider(),
      child: Consumer<PublishNewsProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Title"),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextFormField(
                      controller: titleController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 2,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          hintText: 'Enter Title',
                          helperMaxLines: 2,
                          hintMaxLines: 2,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Constant.primaryColor)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Constant.primaryColor))
                          // border: InputBorder.none
                          ),
                      onSaved: (value) {
                        setState(() {
                          // _amount = value!;
                        });
                      },
                      validator: (String? value) {
                        return (value != null) ? null : "Please Enter Amount";
                      })),
              buildText("Detail"),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextFormField(
                      controller: detailController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 5,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          hintText: 'Enter Detail',
                          helperMaxLines: 2,
                          hintMaxLines: 2,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Constant.primaryColor)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Constant.primaryColor))
                          // border: InputBorder.none
                          ),
                      onSaved: (value) {
                        setState(() {
                          // _amount = value!;
                        });
                      },
                      validator: (String? value) {
                        return (value != null) ? null : "Please Enter Amount";
                      })),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    primary: Constant.primaryColor,
                    elevation: 5.0,
                    minimumSize: Size(250.0, 40.0),
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
                onPressed: () {
                  postNews();
                  // if (_formKey.currentState!.validate()) {

                  // }
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void postNews() {
    String title = titleController.text;
    String detail = detailController.text;
    int date = DateTime.now().millisecondsSinceEpoch;

    NewsItem newsItem = NewsItem(
      title: title,
      detail: detail,
      date: date,
    );
    _provider.postNews(newsItem);
    textController();
  }

  void textController() {
    titleController.clear();
    detailController.clear();
  }

  Widget buildText(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 12, 16, 0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

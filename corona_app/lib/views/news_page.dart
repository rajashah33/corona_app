import 'package:corona_app/scopped_models/home_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);
  // final String title;

  @override
  _NewsPageState createState() {
    return _NewsPageState();
  }
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScopedModel>(
      builder: (context, child, model) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[Text('news Page')],
          ),
        ),
      ),
    );
  }
}

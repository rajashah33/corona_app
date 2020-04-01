import 'package:corona_app/scopped_models/home_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FundPage extends StatefulWidget {
  FundPage({Key key}) : super(key: key);
  // final String title;

  @override
  _FundPageState createState() {
    return _FundPageState();
  }
}

class _FundPageState extends State<FundPage> {
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

import 'package:corona_app/scopped_models/home_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:corona_app/views/tracker_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScopedModel>(
      builder: (context, child, model) => Scaffold(
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrackerPage(url: 'https://www.covid19india.org/')));
              },
              child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[Text('INDIA COVID-19 TRACKER')],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrackerPage(
                            url:
                                'https://www.worldometers.info/coronavirus/')));
              },
              child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[Text('WORLD COVID-19 STATISTICS')],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrackerPage(
                            url: 'https://www.covidvisualizer.com/')));
              },
              child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[Text('GLOBE COVID-19 VISUALISER')],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

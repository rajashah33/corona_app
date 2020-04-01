import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:corona_app/scopped_models/home_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:corona_app/views/reminder_page.dart';
import 'package:corona_app/views/tracker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  // final String title;

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
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(children: <Widget>[
                CarouselSlider(
                  items: [
                    'https://i.picsum.photos/id/0/5616/3744.jpg',
                    'https://i.picsum.photos/id/0/5616/3744.jpg',
                    'https://i.picsum.photos/id/0/5616/3744.jpg',
                    'https://i.picsum.photos/id/0/5616/3744.jpg',
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(i)),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                
              ]),
              // Container(
              //   height: 150,
              //   width: MediaQuery.of(context).size.width,
              //   child: Carousel(
              //     images: [
              //       NetworkImage('https://i.picsum.photos/id/0/5616/3744.jpg'),
              //       NetworkImage('https://i.picsum.photos/id/0/5616/3744.jpg'),
              //       NetworkImage('https://i.picsum.photos/id/0/5616/3744.jpg'),
              //       NetworkImage('https://i.picsum.photos/id/0/5616/3744.jpg')
              //     ],
              //   ),
              // ),
              Row(
                children: <Widget>[
                  CupertinoButton(
                    child: Container(
                      height: MediaQuery.of(context).size.width / 2 - 35,
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/veg.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          "Mindfulness",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Card is clicked.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('ok'),
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  CupertinoButton(
                    child: Container(
                      height: MediaQuery.of(context).size.width / 2 - 35,
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/veg.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          "Mindfulness",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Card is clicked.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('ok'),
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Card(
                      // margin: EdgeInsets.all(10.0),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[Text('Set Reminders')],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReminderPage()));
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[Text('Someone Outside ')],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackerPage(
                                  url: 'https://www.covid19india.org/')));
                    },
                  ),
                ],
              ),
              GestureDetector(
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackerPage(
                              url: 'https://www.covid19india.org/')));
                },
              ),
              GestureDetector(
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackerPage(
                              url:
                                  'https://www.worldometers.info/coronavirus/')));
                },
              ),
              GestureDetector(
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackerPage(
                              url: 'https://www.covidvisualizer.com/')));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

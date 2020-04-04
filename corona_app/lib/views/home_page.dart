import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corona_app/config/RedirectURL.dart';
import 'package:corona_app/locator.dart';
import 'package:corona_app/scopped_models/home_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:corona_app/views/redirect_page.dart';
import 'package:corona_app/views/tracker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  RedirectURL redirectURL = locator.get<RedirectURL>();
  final databaseRef = Firestore.instance;
  List imageList = [];
  @override
  void initState() {
    super.initState();
    // Fetching List of image links from FireStore
    databaseRef
        .collection('covid19InfoImage')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      setState(() {
        snapshot.documents.forEach((f) {
          // f.data['id']
          imageList.add(f.data['link'].toString());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScopedModel>(
      builder: (context, child, model) => Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              imageList.isEmpty
                  ? Center(
                      child: Container(
                        padding: EdgeInsets.all(50),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.greenAccent,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Stack(children: <Widget>[
                        GestureDetector(
                          child: CarouselSlider(
                            autoPlay: true,
                            items: imageList.map((i) {
                              print('----' + imageList.length.toString());
                              try {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      // padding: EdgeInsets.all(8.0),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: i,
                                        fit: BoxFit.fill,
                                        // width: MediaQuery.of(context).size.width * .6,
                                        alignment: Alignment.center,
                                      ),
                                    );
                                  },
                                );
                              } catch (e) {
                                print(
                                    '---Exception in home_page.dart in memoryNetwork image load');
                              }
                            }).toList(),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RedirectPage()));
                          },
                        ),
                      ]),
                    ),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                      height: MediaQuery.of(context).size.width / 2 - 100,
                      width: MediaQuery.of(context).size.width / 2 - 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/whologo.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                title: Text('CORONAVIRUS DISEASE (COVID-19)\nGENERAL ADVICE FOR PUBLIC'),
                                subtitle: Text(
                                    '\nWORLD HEALTH ORGANIZARION'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TrackerPage(url: redirectURL.general)));
                },
              ),
              SizedBox(
                width: 10.0,
              ),
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
              GestureDetector(
                child: Card(
                  // margin: EdgeInsets.all(10.0),
                  elevation: 2.0,
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
                  // margin: EdgeInsets.all(10.0),
                  elevation: 2.0,
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
                  // margin: EdgeInsets.all(10.0),
                  elevation: 2.0,
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

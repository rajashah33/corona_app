import 'package:corona_app/config/RedirectText.dart';
import 'package:corona_app/config/RedirectURL.dart';
import 'package:corona_app/scopped_models/redirect_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:corona_app/views/tracker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../locator.dart';

class RedirectPage extends StatefulWidget {
  RedirectPage({Key key}) : super(key: key);
  // final String title;

  @override
  _RedirectPageState createState() {
    return _RedirectPageState();
  }
}

class _RedirectPageState extends State<RedirectPage> {
  RedirectText redirectText = locator.get<RedirectText>();
  RedirectURL redirectURL = locator.get<RedirectURL>();

  @override
  Widget build(BuildContext context) {
    return BaseView<RedirectScopedModel>(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          title: Text('WHO and MOHFW'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('Ministry of Health and Family Welfare'),
                          subtitle: Text('Govt. of India'),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('India Covid-19 Statistics'),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TrackerPage(
                                          url:
                                              'https://www.covid19india.org')));
                            },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.mohfw, redirectURL.mohfw),
                  SizedBox(
                    width: 10.0,
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('World Health Organization'),
                          subtitle: Text(
                              'Coronavirus disease (COVID-19) technical guidance'),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            title: Text('World Covid-19 Statistics'),
                          )
                        ],
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
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.general, redirectURL.general),
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.infection, redirectURL.infection),
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.institute, redirectURL.institute),
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.gather, redirectURL.gather),
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.animals, redirectURL.animals),
                  SizedBox(
                    width: 10.0,
                  ),
                  ReliefCard(redirectText.guides, redirectURL.guides),
                ]),
          ),
        ),
      ),
    );
  }
}

class ReliefCard extends StatelessWidget {
  final String txt;
  final String url;

  const ReliefCard(this.txt, this.url);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                // Column 1
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(txt,
                            style:
                                GoogleFonts.lato(fontStyle: FontStyle.normal),
                            textScaleFactor: 1.1),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.width / 4,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            "Visit Page",
                            style:
                                GoogleFonts.lato(fontStyle: FontStyle.normal),
                            textScaleFactor: 1.1,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TrackerPage(url: url)));
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}

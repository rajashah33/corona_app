import 'package:corona_app/scopped_models/reminder_scoped_model.dart';
import 'package:corona_app/views/base_view.dart';
import 'package:corona_app/views/custom_reminder.dart';
import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderScopedModel>(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          title: Text('Reminder'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(children: [
                  Text('Enable Reminder'),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ]),
              ),
              AbsorbPointer(
                absorbing: !isSwitched,
                child: Opacity(
                  opacity: isSwitched ? 1.0 : 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            child: _buildRowCard(context, "assets/handwash.png",
                                Colors.blue, '0', 'Wash Hands Reminder     '),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomReminder()));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Expanded(
                          child: InkWell(
                            child: _buildRowCard(
                                context,
                                "assets/citricfruit.png",
                                Colors.orange,
                                '3',
                                'Eat Citric Food Reminder'),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowCard(
      context, String imagePath, Color color, String text, String title) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: color,
                  foregroundColor: Colors.white70,
                ),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      // color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            )
          ],
        ),
      ),
      color: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}



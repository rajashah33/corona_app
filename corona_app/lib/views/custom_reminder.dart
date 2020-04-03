import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomReminder extends StatefulWidget {
  @override
  _CustomReminderState createState() => _CustomReminderState();
}

class _CustomReminderState extends State<CustomReminder> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  TimeOfDay _pickedTime = TimeOfDay.now();

  List timeList = [
    TimeOfDay(hour: 10, minute: 00),
    TimeOfDay(hour: 15, minute: 00),
    TimeOfDay(hour: 19, minute: 00)
  ];
  String label = 'Time to wash your hands';

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetting = IOSInitializationSettings();
    var initSettings = InitializationSettings(androidSetting, iosSetting);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
    setTimeData();
  }

  void setTimeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('label', label);
    prefs.setStringList('timeList', timeList);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Notifi clicked'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Wash Hand Reminder'),
      ),
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(8.0),
              child: Text('Repeat timing in a day:',
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        // color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Label:  ', style: TextStyle(fontSize: 18)),
                  Flexible(
                      child: TextFormField(
                    initialValue: label,
                    onChanged: (text) {
                      label = text;
                    },
                  )),
                ],
              ),
            ),
            RaisedButton(
              child: Text('+ Add more time'),
              onPressed: () {
                setState(() {
                  timeList.add(TimeOfDay.now());
                  _scheduleNotification();
                });
                print(timeList);
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: timeList.length,
                  itemBuilder: (context, index) => this._buildRow(index)),
            )

            // _buildCustomExpansion(context)
          ],
        ),
      ),
    );
  }

  _buildRow(int index) {
    return Card(
      child: ListTile(
          leading: Text('At Time: '),
          title: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              child: Text(timeList[index].hour.toString() +
                  ':' +
                  timeList[index].minute.toString()),
              onPressed: () async {
                var _time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                timeList[index] = _time;
                print(timeList);
                setState(() {
                  _pickedTime = _time;
                });
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              timeList.removeAt(index);
              setState(() {});
            },
          )),
    );
  }

  void showNotif() async {
    var android = AndroidNotificationDetails(
        'channel id', 'channel Name', 'Channel Description');
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android, ios);
    var scheduledNotificationDateTime =
        new DateTime.now().add(Duration(seconds: 10));
    await flutterLocalNotificationsPlugin.schedule(
        0, 'Title ', 'Body', scheduledNotificationDateTime, platform);
  }

  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  /// Schedules a notification that specifies a different icon, sound and vibration pattern
  Future<void> _scheduleNotification() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 20));
    // var vibrationPattern = Int64List(4);
    // vibrationPattern[0] = 0;
    // vibrationPattern[1] = 1000;
    // vibrationPattern[2] = 5000;
    // vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description',
        // icon: 'secondary_icon',
        // sound: 'slow_spring_board',
        // largeIcon: 'sample_large_icon',
        largeIconBitmapSource: BitmapSource.Drawable,
        // vibrationPattern: vibrationPattern,
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}

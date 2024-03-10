import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DormitoryPage(),
    );
  }
}

class DormitoryPage extends StatefulWidget {
  @override
  _DormitoryPageState createState() => _DormitoryPageState();
}

class _DormitoryPageState extends State<DormitoryPage> {
  int likes = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Общежития КубГАУ"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://sun6-20.userapi.com/s/v1/if2/5KzWOm7-zuFbvIsFRwKpM6sl2YLZ1VhRFVL0OK1BQjEHZIqp0PYjKQ2hk9eJ36POQUwlGwXQ47KOTT0OyW-xiQ9y.jpg?size=200x200&quality=96&crop=286,118,761,761&ava=1',
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
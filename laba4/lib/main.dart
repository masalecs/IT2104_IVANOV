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

  void incrementLikes() {
    setState(() {
      likes++;
    });
  }
  void shareDormitory() {
    Share.share('Поделиться информацией об общежитии');
  }
  void copyAddress() {
    Clipboard.setData(ClipboardData(text: "г. Краснодар, ул. Калинина 13/20"));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Адрес скопирован в буфер обмена'),
    ));
  }
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Общежитие 20",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "г. Краснодар, ул. Калинина 13/20",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: incrementLikes,
                          ),
                          Text("$likes"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.phone, color: Colors.green),
                            onPressed: () async{
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: "79883669926",
                              );
                              if (await canLaunchUrl(url)){
                                await launchUrl(url);
                              } else{
                                print('Не удалось');
                              }
                            },
                          ),
                          Text('Позвонить'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.directions, color: Colors.green),
                            onPressed: copyAddress,
                          ),
                          Text('Маршрут'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.share, color: Colors.green),
                              onPressed: shareDormitory),
                          Text('Поделиться'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

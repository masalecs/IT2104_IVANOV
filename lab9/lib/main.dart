import 'package:flutter/material.dart';
import 'classes/machine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Machine App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();

  Machine coffeeMachine = Machine(50, 0, 100, 0);

  void _addResource(String resourceType) {
    setState(() {
      switch (resourceType) {
        case 'coffeeBeans':
          coffeeMachine.coffeeBeans += 50;
          break;
        case 'milk':
          coffeeMachine.milk += 50;
          break;
        case 'water':
          coffeeMachine.water += 50;
          break;
      }
    });
    _controller.clear();
  }

  void _makeEspresso() {
    setState(() {
      final snackBar = SnackBar(
          content: Text(coffeeMachine.makingCoffee()),
          duration: const Duration(seconds: 1)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Machine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ресурсы кофемашины:', style: TextStyle(fontSize: 16,)),
            const SizedBox(height: 5),
            Text('Кофе: ${coffeeMachine.coffeeBeans}г'),
            Text('Молоко: ${coffeeMachine.milk}мл'),
            Text('Вода: ${coffeeMachine.water}мл'),
            Text('Деньги: ${coffeeMachine.cash}руб'),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: const Text('Добавить 50 единиц ресурса:', style: TextStyle(fontSize: 16,))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _addResource('coffeeBeans'),
                    child: const Text('Кофе'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _addResource('milk'),
                    child: const Text('Молоко'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _addResource('water'),
                    child: const Text('Вода'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _makeEspresso,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 36),
              ),
              child: const Text('Приготовить эспрессо'),
            ),
          ],
        ),
      ),
    );
  }
}

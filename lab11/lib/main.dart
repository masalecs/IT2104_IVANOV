import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AsyncDelayedActions.dart';

import 'classes/Machine.dart';
import 'classes/Resources.dart';
import 'classes/Coffee.dart';
import 'classes/ICoffee.dart';

void main() {
  runApp(CoffeeMachineApp());
}

class CoffeeMachineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Machine App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CoffeeMachinePage(),
    );
  }
}

class CoffeeMachinePage extends StatefulWidget {
  @override
  _CoffeeMachinePageState createState() => _CoffeeMachinePageState();
}

class _CoffeeMachinePageState extends State<CoffeeMachinePage> {
  final Machine coffeeMachine = Machine(Resources(100, 300, 100, 0));

  void addResource(String resourceType) {
    setState(() {
      coffeeMachine.fillResources(resourceType, 100);
    });
  }

  void makeCoffee(ICoffee coffeeType) async {
    String message = '';
    setState(() {
      message = coffeeMachine.makeCoffeeByType(coffeeType);
    });
    if (message == '${coffeeType.toString()} готов!') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Началось приготовление кофе...'),
          duration: Duration(seconds: 2),
        ),
      );

      try {
        CoffeeMaker coffeeMaker;
        coffeeMaker = await CoffeeMaker.makeCoffee(coffeeType);
      }
      catch (e) {
        print('Ошибка: ${e.toString()}');
      }

      setState(() {
        final snackBar = SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2)
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
    else {
      final snackBar = SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    Resources resources = coffeeMachine.resources;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Machine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
              else {
                SystemNavigator.pop();
              }
            }
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
            Text('Кофе: ${resources.coffeeBeans}г'),
            Text('Молоко: ${resources.milk}мл'),
            Text('Вода: ${resources.water}мл'),
            Text('Деньги: ${resources.cash}руб'),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: const Text('Добавить 100 единиц ресурса:', style: TextStyle(fontSize: 16,))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addResource('coffeeBeans'),
                    child: const Text('Кофе'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addResource('milk'),
                    child: const Text('Молоко'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addResource('water'),
                    child: const Text('Вода'),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: const Text('Сделать кофе', style: TextStyle(fontSize: 16,))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => makeCoffee(Espresso()),
                    child: const Text('Эспрессо', style: TextStyle(fontSize: 16)),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => makeCoffee(Cappuccino()),
                    child: const Text('Капучино', style: TextStyle(fontSize: 16)),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => makeCoffee(Latte()),
                    child: const Text('Латте', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

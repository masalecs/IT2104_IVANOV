import 'package:lab11/classes/Coffee.dart';
import 'package:lab11/classes/ICoffee.dart';

class CoffeeMaker {
  CoffeeMaker._();

  static Future<CoffeeMaker> makeCoffee(ICoffee coffeeType) async {
    var coffeeMaker = CoffeeMaker._();
    print('_start_');
    await coffeeMaker.heatWater();
    switch (coffeeType) {
      case Espresso _:
        await coffeeMaker.brewCoffee();
      case Cappuccino _ || Latte _:
        await Future.wait([coffeeMaker.brewCoffee(), coffeeMaker.whipMilk()]);
        await coffeeMaker.mixCoffeeAndMilk();
    }
    print('${coffeeType.toString()} is ready');
    print('_end_');
    return coffeeMaker;
  }


    Future<void> heatWater() async {
    print('start_process: heat water');
    await Future.delayed(Duration(seconds: 3));
    print('done_process: heat water');
  }

  Future<void> brewCoffee() async {
    print('start_process: brew coffee');
    await Future.delayed(Duration(seconds: 5));
    print('done_process: brew coffee');
  }

  Future<void> whipMilk() async {
    print('start_process: whip milk');
    await Future.delayed(Duration(seconds: 5));
    print('done_process: whip milk');
  }

  Future<void> mixCoffeeAndMilk() async {
    print('start_process: mixing');
    await Future.delayed(Duration(seconds: 3));
    print('done_process: mixing');
  }

}
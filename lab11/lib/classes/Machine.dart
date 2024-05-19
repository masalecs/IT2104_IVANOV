import 'Resources.dart';
import 'ICoffee.dart';

class Machine {
  Resources resources;

  Machine(this.resources);


  void fillResources(String resource, num value) {
    resources.addResource(resource, value);
  }

  String makeCoffeeByType(ICoffee coffeeType) {
    if (isAvailableResources(coffeeType)) {
      Resources needed = coffeeType.getResource();

      resources.coffeeBeans -= needed.coffeeBeans;
      resources.milk -= needed.milk;
      resources.water -= needed.water;
      resources.cash += needed.cash;

      return '${coffeeType.toString()} готов!';
    }
    else {
      return 'Недостаточно ресурсов :(';
    }
  }

  bool isAvailableResources(ICoffee coffeeType) {
    Resources needed = coffeeType.getResource();

    if (resources.coffeeBeans < needed.coffeeBeans ||
        resources.milk < needed.milk ||
        resources.water < needed.water) {
      return false;
    }
    return true;
  }
}


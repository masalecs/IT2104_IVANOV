class Machine {
  num _coffeeBeans = 0;
  num _milk = 0;
  num _water = 0;
  num _cash = 0;

  Machine(this._coffeeBeans, this._milk, this._water, this._cash);

  num get coffeeBeans => _coffeeBeans;
  set coffeeBeans(num value) => _coffeeBeans = value;

  num get milk => _milk;
  set milk(num value) => _milk = value;

  num get water => _water;
  set water(num value) => _water = value;

  num get cash => _cash;
  set cash(num value) => _cash = value;

  bool isAvailable() {
    return _coffeeBeans >= 50 && _water >= 100;
  }

  void subtractResources(num coffeeBeans, num milk, num water) {
    _coffeeBeans -= coffeeBeans;
    _milk -= milk;
    _water -= water;
  }

  String makingCoffee() {
    if (isAvailable()) {
      subtractResources(50, 0, 100);
      cash += 100;
      return "Эспрессо готов!";
    } else {
      return "Недостаточно ресурсов";
    }
  }
}


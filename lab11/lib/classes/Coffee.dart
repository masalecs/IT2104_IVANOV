import 'ICoffee.dart';
import 'Resources.dart';

class Espresso implements ICoffee {
  @override
  Resources getResource() {
    return Resources(54, 0, 90, 150);
  }
  String toString() => 'Эспрессо';
}

class Cappuccino implements ICoffee {
  @override
  Resources getResource() {
    return Resources(22, 270, 30, 180);
  }
  String toString() => 'Капучино';
}

class Latte implements ICoffee {
  @override
  Resources getResource() {
    return Resources(18, 270, 30, 170);
  }
  String toString() => 'Латте';
}
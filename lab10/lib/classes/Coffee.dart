import 'ICoffee.dart';
import 'Resources.dart';

class Espresso implements ICoffee {
  @override
  Resources getResource() {
    return Resources(54, 0, 90, 150);
  }
}

class Cappuccino implements ICoffee {
  @override
  Resources getResource() {
    return Resources(22, 270, 30, 180);
  }
}

class Latte implements ICoffee {
  @override
  Resources getResource() {
    return Resources(18, 270, 30, 170);
  }
}
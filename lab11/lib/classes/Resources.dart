class Resources {
  num coffeeBeans;
  num milk;
  num water;
  num cash;

  Resources(this.coffeeBeans, this.milk, this.water, this.cash);

  num getResource(String resource) {
    switch (resource) {
      case 'coffeeBeans':
        return coffeeBeans;
      case 'milk':
        return milk;
      case 'water':
        return water;
      case 'cash':
        return cash;
      default:
        throw Exception('Неизвестный ресурс: $resource');
    }
  }

  void setResource(String resource, num value) {
    switch (resource) {
      case 'coffeeBeans':
        coffeeBeans = value;
        break;
      case 'milk':
        milk = value;
        break;
      case 'water':
        water = value;
        break;
      case 'cash':
        cash = value;
        break;
      default:
        throw Exception('Неизвестный ресурс: $resource');
    }
  }

  void addResource(String resource, num value) {
    switch (resource) {
      case 'coffeeBeans':
        coffeeBeans += value;
        break;
      case 'milk':
        milk += value;
        break;
      case 'water':
        water += value;
        break;
      case 'cash':
        cash += value;
        break;
      default:
        throw Exception('Неизвестный ресурс: $resource');
    }
  }
}
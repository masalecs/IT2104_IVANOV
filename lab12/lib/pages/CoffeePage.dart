import 'package:flutter/material.dart';
import '../classes/Machine.dart';
import '../classes/ICoffee.dart';
import '../classes/Coffee.dart';
import 'package:flutter/material.dart';
import '../classes/Machine.dart';
import '../classes/ICoffee.dart';
import '../classes/Coffee.dart';
import '../classes/Enums.dart';

class CoffeePage extends StatefulWidget {
  final CoffeeMachine coffeeMachine;

  CoffeePage(this.coffeeMachine);

  @override
  _CoffeePageState createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  String _message = '';
  CoffeeType? _selectedCoffeeType;
  final TextEditingController _moneyController = TextEditingController();

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _prepareCoffee() {
    if (_selectedCoffeeType != null) {
      try {
        ICoffee coffee = getCoffeeByType(_selectedCoffeeType!);
        widget.coffeeMachine.makeCoffeeByType(coffee);
        setState(() {});
        _showSnackbar('Ваш ${_selectedCoffeeType.toString().split('.').last} готов!');
      } catch (e) {
        _showSnackbar(e.toString());
      }
    } else {
      _showSnackbar('Пожалуйста, выберите вид кофе');
    }
  }

  void _addMoney() {
    int? moneyToAdd = int.tryParse(_moneyController.text);

    if (moneyToAdd != null && moneyToAdd > 0) {
      widget.coffeeMachine.addResources(0, 0, 0, moneyToAdd);
      setState(() {});
      _moneyController.clear();
      _showSnackbar('Добавлено $moneyToAdd денег');
    } else if (moneyToAdd != null && moneyToAdd < 0) {
      _showSnackbar('Недостаточно средств');
    } else {
      _showSnackbar('Пожалуйста, введите корректную сумму');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildResourceItem('Кофейные зерна', widget.coffeeMachine.getResources().coffeeBeans),
                  _buildResourceItem('Молоко', widget.coffeeMachine.getResources().milk),
                  _buildResourceItem('Вода', widget.coffeeMachine.getResources().water),
                  _buildResourceItem('Деньги', widget.coffeeMachine.getResources().cash),
                ],
              ),
            ),
            Container(
              color: Colors.brown,
              padding: EdgeInsets.all(20),
              child: Text(
                'Кофемашина',
                style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        RadioListTile<CoffeeType>(
                          title: Text('Эспрессо'),
                          value: CoffeeType.Espresso,
                          groupValue: _selectedCoffeeType,
                          onChanged: (CoffeeType? value) {
                            setState(() {
                              _selectedCoffeeType = value;
                            });
                          },
                        ),
                        RadioListTile<CoffeeType>(
                          title: Text('Капучино'),
                          value: CoffeeType.Cappuccino,
                          groupValue: _selectedCoffeeType,
                          onChanged: (CoffeeType? value) {
                            setState(() {
                              _selectedCoffeeType = value;
                            });
                          },
                        ),
                        RadioListTile<CoffeeType>(
                          title: Text('Латте'),
                          value: CoffeeType.Latte,
                          groupValue: _selectedCoffeeType,
                          onChanged: (CoffeeType? value) {
                            setState(() {
                              _selectedCoffeeType = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _prepareCoffee,
                    child: Text('Приготовить', style: TextStyle(fontSize: 20, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _moneyController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Сумма денег',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addMoney,
                    child: Icon(Icons.monetization_on, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                        minimumSize: Size(70, 65)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildResourceItem(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  ICoffee getCoffeeByType(CoffeeType type) {
    switch (type) {
      case CoffeeType.Espresso:
        return Espresso();
      case CoffeeType.Cappuccino:
        return Cappuccino();
      case CoffeeType.Latte:
        return Latte();
      default:
        throw Exception('Неподдерживаемый тип кофе');
    }
  }
}

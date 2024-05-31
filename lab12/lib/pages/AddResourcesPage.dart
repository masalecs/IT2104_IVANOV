import 'package:flutter/material.dart';
import '../classes/Machine.dart';

class AddResourcesPage extends StatefulWidget {
  final CoffeeMachine coffeeMachine;

  AddResourcesPage(this.coffeeMachine);

  @override
  _AddResourcesPageState createState() => _AddResourcesPageState();
}

class _AddResourcesPageState extends State<AddResourcesPage> {
  TextEditingController _coffeeController = TextEditingController();
  TextEditingController _milkController = TextEditingController();
  TextEditingController _waterController = TextEditingController();
  TextEditingController _cashController = TextEditingController();

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _addResources() {
    int coffee = int.tryParse(_coffeeController.text) ?? 0;
    int milk = int.tryParse(_milkController.text) ?? 0;
    int water = int.tryParse(_waterController.text) ?? 0;
    int cash = int.tryParse(_cashController.text) ?? 0;

    setState(() {
      widget.coffeeMachine.addResources(coffee, milk, water, cash);
    });

    _showSnackbar('Ресурсы успешно добавлены');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              color: Colors.brown,
              padding: EdgeInsets.all(20),
              child: Text(
                'Добавить ресурсы',
                style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            _buildResourceInput('Кофейные зерна', _coffeeController),
            _buildResourceInput('Молоко', _milkController),
            _buildResourceInput('Вода', _waterController),
            _buildResourceInput('Деньги', _cashController),
            SizedBox(height: 20), // Уменьшаем расстояние между полями и кнопкой
            ElevatedButton(
              onPressed: _addResources,
              child: Text('Добавить', style: TextStyle(fontSize: 25, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(370, 65),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Введите количество',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}

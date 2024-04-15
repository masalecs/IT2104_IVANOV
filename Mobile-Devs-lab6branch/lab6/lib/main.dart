import 'package:flutter/material.dart';
import 'package:lab6/MyCustomForm.dart';

void main() => runApp(MyApp());

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>(); 

  String _str = "";

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _str =
            'Area is equal to ${(int.parse(f1.text) * int.parse(f2.text)).toString()}';
      });

      SnackBar snackBar = const SnackBar(content: Text('Processing complete!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        _str = "";
      });
    }
  }

  final f1 = TextEditingController();
  final f2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(child: Text("Высота(mm^2):"), flex: 10),
                  Expanded(
                      flex: 29,
                      child: TextFormField(
                        controller: f1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите высоту';
                          }
                          return null;
                        },
                      )),
                ],
              ),
              Row(children: [
                const Expanded(
                  child: Text("Ширина(mm^2):"),
                  flex: 1,
                ),
                Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: f2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите ширину';
                        }
                        return null;
                      },
                    )),
              ]),
              const SizedBox(height: 50),
              ElevatedButton(onPressed: _calculate, child: Text("Рассчитать")),
              const SizedBox(height: 30),
              Text(_str)
            ],
          ),
        ));
  }
}

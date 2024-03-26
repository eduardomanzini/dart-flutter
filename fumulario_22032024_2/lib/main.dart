import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário com Campo de Seleção',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String _selectedCar = 'Volvo'; // Valor padrão do campo de seleção

  // Lista de opções para o campo de seleção
  List<String> _cars = ['Volvo', 'Saab', 'Mercedes', 'Audi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário com Campo de Seleção'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Escolha um carro:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedCar,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCar = newValue!;
                  });
                },
                items: _cars.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Envia o valor selecionado do carro para o console
                  print('Carro selecionado: $_selectedCar');
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
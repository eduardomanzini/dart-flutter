import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Equipamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EquipamentosPage(),
    );
  }
}

class EquipamentosPage extends StatefulWidget {
  @override
  _EquipamentosPageState createState() => _EquipamentosPageState();
}

class _EquipamentosPageState extends State<EquipamentosPage> {
  List<dynamic> equipamentos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEquipamentos();
  }

  Future<void> fetchEquipamentos() async {
    try {
      final response = await http.get(Uri.parse('https://app-web-uniara-example-60f73cc06c77.herokuapp.com/equipamentos'));

      if (response.statusCode == 200) {
        setState(() {
          equipamentos = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Falha ao carregar equipamentos');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  Future<void> reservarEquipamento(int equipamentoId) async {
    try {
      final response = await http.post(
        Uri.parse('https://app-web-uniara-example-60f73cc06c77.herokuapp.com/equipamentos/$equipamentoId/reservar'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        setState(() {
          final index = equipamentos.indexWhere((e) => e['id'] == equipamentoId);
          if (index != -1) {
            equipamentos[index]['disponivel'] = false;
            equipamentos[index]['data_retirada'] = DateTime.now().toString(); // Atualiza a data de retirada
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Equipamento reservado com sucesso!'),
        ));
      } else {
        throw Exception('Falha ao reservar equipamento');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao reservar equipamento'),
      ));
    }
  }

  Future<void> liberarEquipamento(int equipamentoId) async {
    try {
      final response = await http.post(
        Uri.parse('https://app-web-uniara-example-60f73cc06c77.herokuapp.com/equipamentos/$equipamentoId/liberar'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        setState(() {
          final index = equipamentos.indexWhere((e) => e['id'] == equipamentoId);
          if (index != -1) {
            equipamentos[index]['disponivel'] = true;
            equipamentos[index]['data_retirada'] = null; // Limpa a data de retirada
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Reserva liberada com sucesso!'),
        ));
      } else {
        throw Exception('Falha ao liberar reserva');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao liberar reserva'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Equipamentos')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('Cadastrar Equipamento'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroEquipamentosPage()),
                );
              },
            ),
            ListTile(
              title: Text('Consultar Equipamentos'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: equipamentos.length,
              itemBuilder: (context, index) {
                final equipamento = equipamentos[index];
                return ListTile(
                  title: Text(equipamento['nome']),
                  subtitle: Text(equipamento['disponivel'] 
                      ? 'Disponível' 
                      : 'Reservado\nRetirado em: ${equipamento['data_retirada'] ?? 'N/A'}'),
                  trailing: equipamento['disponivel']
                      ? ElevatedButton(
                          onPressed: () {
                            reservarEquipamento(equipamento['id']);
                          },
                          child: Text('Reservar'),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            liberarEquipamento(equipamento['id']);
                          },
                          child: Text('Liberar'),
                        ),
                );
              },
            ),
    );
  }
}

class CadastroEquipamentosPage extends StatefulWidget {
  @override
  _CadastroEquipamentosPageState createState() => _CadastroEquipamentosPageState();
}

class _CadastroEquipamentosPageState extends State<CadastroEquipamentosPage> {
  final _nomeController = TextEditingController();

  Future<void> cadastrarEquipamento() async {
    final nome = _nomeController.text;
    if (nome.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('https://app-web-uniara-example-60f73cc06c77.herokuapp.com/equipamentos/cadastrar'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"nome": nome}),
        );

        if (response.statusCode == 200) {
          Navigator.pop(context);
        } else {
          throw Exception('Falha ao cadastrar equipamento');
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao cadastrar equipamento'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Equipamento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Equipamento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cadastrarEquipamento,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}

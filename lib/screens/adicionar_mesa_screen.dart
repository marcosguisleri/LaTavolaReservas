import 'package:flutter/material.dart';
import 'hub_screen.dart'; // Importar a tela HubScreen

class AddTableScreen extends StatelessWidget {
  final TextEditingController tableNameController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xFF457431),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HubScreen()),
                  );
                },
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Cadastrar Mesa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: tableNameController,
                    decoration: InputDecoration(
                      labelText: 'Nome da Mesa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: capacityController,
                    decoration: InputDecoration(
                      labelText: 'Capacidade',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para adicionar a mesa
                      String tableName = tableNameController.text;
                      String capacity = capacityController.text;
                      // Aqui você pode adicionar a lógica para salvar a mesa
                      print('Mesa: $tableName, Capacidade: $capacity');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Cor de fundo do botão
                        foregroundColor: Color(0xFFa4240e), // Cor do texto
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10), // Padding do botão
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordas arredondadas
                        ),
                        elevation: 5, // Sombra
                    ),
                    child: Text('Cadastrar Mesa'),
                  ),
                ],
              ),
            ),
            // Footer fixo
            Spacer(),
            Container(
              width: double.infinity,
              color: Color(0xFF457431),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  'La Tavola © 2024 - Todos os Direitos Reservados',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

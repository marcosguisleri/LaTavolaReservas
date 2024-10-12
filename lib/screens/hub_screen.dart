import 'package:flutter/material.dart';
import 'home_screen.dart';

class HubScreen extends StatelessWidget {
  // Listas de mesas (exemplo)
  final List<String> availableTables = ['Mesa 1', 'Mesa 2', 'Mesa 3'];
  final List<String> reservedTables = ['Mesa 4', 'Mesa 5'];

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
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
            const SizedBox(height: 30),
            Text(
              'Mesas Disponíveis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: availableTables.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 10,
                      ),
                      title: Text(availableTables[index]),
                      subtitle: Text('Capacidade: 4 pessoas'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Implementar a lógica de reserva
                        },
                        child: Text('Reservar'),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Mesas Reservadas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reservedTables.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 10,
                      ),
                      title: Text(reservedTables[index]),
                      subtitle: Text('Capacidade: 4 pessoas'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Implementar a lógica de cancelamento da reserva
                        },
                        child: Text('Cancelar'),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Footer fixo
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

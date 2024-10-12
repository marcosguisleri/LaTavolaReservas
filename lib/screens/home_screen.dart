import 'package:flutter/material.dart';
import 'hub_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF457431), // Cor da barra
      ),
      backgroundColor: const Color(0xFF457431),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HubScreen()),
                  );
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
                child: Text('Acessar o Sistema', // Texto do botão
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte
                      fontWeight: FontWeight.bold, // Negrito
                    )))
          ],
        ),
      ),
    );
  }
}

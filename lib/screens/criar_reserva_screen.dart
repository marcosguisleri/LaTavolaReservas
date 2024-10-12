import 'package:flutter/material.dart';

class CreateReservationScreen extends StatefulWidget {
  final List<String> availableTables;

  CreateReservationScreen({required this.availableTables});

  @override
  _CreateReservationScreenState createState() => _CreateReservationScreenState();
}

class _CreateReservationScreenState extends State<CreateReservationScreen> {
  String? selectedTable;
  String? selectedDate;
  String? selectedTime;

  // Função para exibir o DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Função para exibir o TimePicker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = "${picked.hour}:${picked.minute}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            color: Color(0xFF457431),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Reservar Mesa',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // Dropdown de seleção de mesas disponíveis
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Selecione a Mesa',
                    border: OutlineInputBorder(),
                  ),
                  items: widget.availableTables.map((String table) {
                    return DropdownMenuItem<String>(
                      value: table,
                      child: Text(table),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTable = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Input para nome do cliente
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do Cliente',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Input para número de pessoas
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Número de Pessoas',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                // Seletor de data
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Data da Reserva',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(selectedDate ?? 'Selecione uma data'),
                  ),
                ),
                const SizedBox(height: 20),
                // Seletor de hora
                InkWell(
                  onTap: () => _selectTime(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Hora da Reserva',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(selectedTime ?? 'Selecione uma hora'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Botão de salvar com estilo atualizado
              ElevatedButton(
                onPressed: () {
                  // Lógica para salvar a reserva
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor de fundo verde
                  foregroundColor: Colors.white, // Texto branco
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                  ),
                  elevation: 5, // Sombra
                ),
                child: Text('Salvar'),
              ),
              // Botão de voltar com estilo atualizado
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Cor de fundo vermelho
                  foregroundColor: Colors.white, // Texto branco
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                  ),
                  elevation: 5, // Sombra
                ),
                child: Text('Voltar'),
              ),
            ],
          ),
          const Spacer(),
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
    );
  }
}

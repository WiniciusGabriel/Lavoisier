import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> historico = [
      'Troca: Arroz Integral por Batata Doce',
      'Troca: Frango por Patinho Moído'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Substituições')),
      body: ListView.builder(
        itemCount: historico.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.blue),
              title: Text(historico[index]),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> historico = [
      'Troca realizada: Arroz Integral por Batata Doce (Hoje)',
      'Troca realizada: Frango por Patinho Moído (Ontem)',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Substituições'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: historico.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.green),
              title: Text(
                historico[index],
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}
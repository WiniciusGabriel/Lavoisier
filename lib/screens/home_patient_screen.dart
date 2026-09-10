import 'package:flutter/material.dart';

class HomePatientScreen extends StatelessWidget {
  const HomePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home do Paciente - Plano do Dia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, '/history'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Card(
            color: Colors.greenAccent,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Meta Diária: 1800 kcal | 140g Proteína', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('Almoço: Frango com Arroz e Salada'),
            subtitle: const Text('Toque para ver detalhes e substituir itens'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/detail'),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SubstituicaoScreen extends StatelessWidget {
  const SubstituicaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de alimentos equivalentes sugeridos
    final List<Map<String, String>> alternativas = [
      {'nome': 'Batata Doce', 'quantidade': '160g', 'calorias': '190 kcal'},
      {'nome': 'Mandioquinha', 'quantidade': '140g', 'calorias': '185 kcal'},
      {'nome': 'Macarrão Integral', 'quantidade': '130g', 'calorias': '195 kcal'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a Substituição'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: alternativas.length,
        itemBuilder: (context, index) {
          final item = alternativas[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              title: Text(
                item['nome']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('Quantidade: ${item['quantidade']} | ${item['calorias']}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Feedback visual imediato para o utilizador (UX)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Substituído com sucesso por ${item['nome']}!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  // Retorna para a tela anterior após selecionar
                  Navigator.pop(context);
                },
                child: const Text('Selecionar'),
              ),
            ),
          );
        },
      ),
    );
  }
}
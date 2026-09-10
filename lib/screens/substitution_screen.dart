import 'package:flutter/material.dart';

class SubstitutionScreen extends StatelessWidget {
  const SubstitutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> equivalentes = ['Batata Doce (180g)', 'Mandioquinha (140g)', 'Macarrão Integral (130g)'];

    return Scaffold(
      appBar: AppBar(title: const Text('Opções de Substituição Equivalentes')),
      body: ListView.builder(
        itemCount: equivalentes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(equivalentes[index]),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Substituição realizada com sucesso!')),
                );
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: const Text('Selecionar'),
            ),
          );
        },
      ),
    );
  }
}
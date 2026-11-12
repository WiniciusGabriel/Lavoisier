import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../app_data.dart';

class SubstituicaoScreen extends StatefulWidget {
  final Map<String, dynamic> alimentoOriginal;

  const SubstituicaoScreen({super.key, required this.alimentoOriginal});

  @override
  State<SubstituicaoScreen> createState() => _SubstituicaoScreenState();
}

class _SubstituicaoScreenState extends State<SubstituicaoScreen> {
  List<Map<String, dynamic>> alternativasInteligentes = [];
  @override
  void initState() {
    super.initState();
    _processarSubstituicoes();
  }

  void _processarSubstituicoes() {
    String categoriaOriginal = widget.alimentoOriginal['categoria'];
    double precoOriginal = widget.alimentoOriginal['preco'];

    alternativasInteligentes = AppData.tabelaAlimentos
        .where((item) {
          return item['categoria'] == categoriaOriginal &&
              item['preco'] < precoOriginal;
        })
        .map((item) => Map<String, dynamic>.from(item))
        .toList();

    alternativasInteligentes
        .sort((a, b) => a['preco'].compareTo(b['preco']));
  }

  Future<void> _trocar(Map<String, dynamic> item, double economia) async {
    final String mensagemTroca =
        'Trocaste 100g de ${widget.alimentoOriginal['nome']} por ${item['nome']} (Poupaste R\$${economia.toStringAsFixed(2)})';

    // 1. Atualiza economia global localmente para resposta imediata
    AppData.economiaDoDia += economia;

    // 2. URL do MockAPI
        const String urlBackend =
        'https://lavoisier-94c3e-default-rtdb.firebaseio.com/historico.json';

    // 3. Envia para o MockAPI (POST)
    try {
      final response = await http.post(
        Uri.parse(urlBackend),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'mensagem': mensagemTroca}),
      );

      if (!mounted) return;

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Substituição salva na nuvem! Poupaste R\$ ${economia.toStringAsFixed(2)}'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Falha no servidor. Tente novamente.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro de conexão. Verifique sua internet.'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lavoisier - Substituições',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.red.shade100,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Alimento Original (100g):',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
                Text(widget.alimentoOriginal['nome'],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                Text(
                    '${widget.alimentoOriginal['calorias']} kcal | ${widget.alimentoOriginal['proteina']}g Prot | R\$ ${widget.alimentoOriginal['preco'].toStringAsFixed(2)}'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Opções mais baratas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: alternativasInteligentes.isEmpty
                ? const Center(
                    child: Text('Nenhuma alternativa mais barata encontrada.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: alternativasInteligentes.length,
                    itemBuilder: (context, index) {
                      final item = alternativasInteligentes[index];
                      final double economia =
                          widget.alimentoOriginal['preco'] - item['preco'];

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 12.0),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.green, width: 1.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['nome'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              const SizedBox(height: 4),
                              Text(
                                  '${item['calorias']} kcal | ${item['proteina']}g Prot | Custo: R\$ ${item['preco'].toStringAsFixed(2)}'),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Poupa R\$ ${economia.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 16),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white),
                                    onPressed: () => _trocar(item, economia),
                                    child: const Text('Trocar'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
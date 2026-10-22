import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Pacote adicionado
import '../app_data.dart';

class SubstituicaoScreen extends StatefulWidget {
  const SubstituicaoScreen({super.key});

  @override
  State<SubstituicaoScreen> createState() => _SubstituicaoScreenState();
}

class _SubstituicaoScreenState extends State<SubstituicaoScreen> {
  final List<Map<String, String>> alternativas = [
    {'nome': 'Batata Doce', 'quantidade': '160g', 'calorias': '190 kcal'},
    {'nome': 'Mandioquinha', 'quantidade': '140g', 'calorias': '185 kcal'},
    {'nome': 'Macarrão Integral', 'quantidade': '130g', 'calorias': '195 kcal'},
    {'nome': 'Pizza (não faz mal à ninguem)', 'quantidade': '500g', 'calorias': '666 kcal'},
    {'nome': 'salada', 'quantidade': '170g', 'calorias': '180 kcal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a Substituição', style: TextStyle(color: Color.fromARGB(255, 8, 8, 8))),
        backgroundColor: const Color.fromARGB(255, 91, 172, 94),
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
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () async {
                  
                  String mensagemTroca = 'Troca realizada: Arroz Integral por ${item['nome']} (Agora)';
                  // 1. Instancia o SharedPreferences
                  final prefs = await SharedPreferences.getInstance();
                  // 2. Busca o histórico atual ou cria uma lista vazia se for a primeira vez
                  List<String> historicoAtual = prefs.getStringList('historico_refeicoes') ?? [];
                  
                  // 3. Adiciona a nova troca na lista
                  historicoAtual.add(mensagemTroca);
                  // 4. Salva a lista atualizada de volta no celular (CRIAR/ATUALIZAR DADOS)
                  await prefs.setStringList('historico_refeicoes', historicoAtual);

                  // Sincroniza a variável global para segurança extra no aplicativo
                  AppData.historicoGlobal = historicoAtual;

                  // Verifica se o widget ainda está montado na tela antes de usar o context
                  if (mounted) {
                    // Mostra o aviso que deu certo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Substituído com sucesso por ${item['nome']}!'),
                        duration: const Duration(seconds: 2),
                      ),
                    );

                    
                    Navigator.pop(context);
                  }
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
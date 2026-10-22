import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_data.dart'; 

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Variável local para armazenar a lista lida do dispositivo
  List<String> _historico = [];

  @override
  void initState() {
    super.initState();
    _carregarHistorico(); // Busca os dados assim que a tela abre
  }
  // RECUPERAR DADOS: Lê o histórico salvo no SharedPreferences
  Future<void> _carregarHistorico() async {
    final prefs = await SharedPreferences.getInstance();
    // Usa getStringList para pegar a lista de textos. Se não existir, retorna lista vazia []
    final historicoSalvo = prefs.getStringList('historico_refeicoes') ?? [];
    
    setState(() {
      _historico = historicoSalvo;
      // Mantém a sua variável global sincronizada, caso outra tela dependa dela
      AppData.historicoGlobal = historicoSalvo;
    });
  }
  // REMOVER DADOS: limpa o historico do sharedPreferences e da variável local
  Future<void> _limparHistorico() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('historico_refeicoes');
    setState(() {
      _historico.clear();
      AppData.historicoGlobal.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Substituições', style: TextStyle(color: Color.fromARGB(255, 5, 5, 5))),
        backgroundColor: Colors.green,
        actions: [
          // Botão para limpar o histórico (ajuda no CRUD - Remover Dados
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _limparHistorico,
            tooltip: 'Limpar Histórico',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _carregarHistorico, 
          ),
        ],
      ),
      body: _historico.isEmpty
          ? const Center(child: Text('Nenhuma substituição registrada.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _historico.length, // Usa a lista carregada do aparelho
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.green),
                    title: Text(
                      _historico[index],
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
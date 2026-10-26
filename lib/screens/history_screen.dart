import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../app_data.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> historico = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarHistorico();
  }

  Future<void> _carregarHistorico() async {
    setState(() => isLoading = true);
    final String urlBackend = kIsWeb 
        ? 'http://localhost:3000/api/historico' 
        : 'http://10.0.2.2:3000/api/historico';

    try {
      final response = await http.get(Uri.parse(urlBackend));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          historico = data.map((item) => item['mensagem'].toString()).toList();
          AppData.historicoGlobal = historico;
          isLoading = false;
        });
      } else {
        _usarHistoricoLocal();
      }
    } catch (e) {
      _usarHistoricoLocal();
    }
  }

  void _usarHistoricoLocal() {
    setState(() {
      historico = List.from(AppData.historicoGlobal);
      isLoading = false;
    });
  }

  // Função para eliminar um item específico da lista
  void _eliminarItem(int index) {
    setState(() {
      historico.removeAt(index);
      AppData.historicoGlobal = historico; // Atualiza a lista global
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Substituição eliminada com sucesso!'),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Substituições', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _carregarHistorico,
            tooltip: 'Atualizar Histórico',
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : historico.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhuma substituição registada.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: historico.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: ListTile(
                        leading: const Icon(Icons.check_circle, color: Colors.green),
                        title: Text(
                          historico[index],
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        // NOVO: Botão de lixeira à direita de cada item
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => _eliminarItem(index),
                          tooltip: 'Eliminar Registo',
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
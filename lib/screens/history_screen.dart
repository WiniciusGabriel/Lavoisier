import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> historico = [];
  // Variáveis de Estado da Tela
  bool isLoading = true; // Carregamento
  String errorMessage = ''; // Erro

  // URL do Firebase Realtime Database (sem barra no final)
  final String baseUrl =
      'https://lavoisier-94c3e-default-rtdb.firebaseio.com';

  @override
  void initState() {
    super.initState();
    _carregarHistorico();
  }

  // OPERAÇÃO 1: CONSULTA DE DADOS (GET)
  Future<void> _carregarHistorico() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response = await http.get(Uri.parse('$baseUrl/historico.json'));

      if (!mounted) return;

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<Map<String, dynamic>> lista = [];

        // O Firebase devolve null (vazio) ou um mapa {id: {mensagem: ...}}
        if (decoded != null) {
          (decoded as Map<String, dynamic>).forEach((key, value) {
            lista.add({'id': key, ...Map<String, dynamic>.from(value)});
          });
        }

        setState(() {
          historico = lista.reversed.toList(); // mais recentes primeiro
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Erro ao buscar dados do servidor (Código: ${response.statusCode})';
          isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Falha na comunicação por rede. Verifique sua conexão.';
        isLoading = false;
      });
    }
  }

  // OPERAÇÃO 2: REMOÇÃO DE DADOS (DELETE)
  Future<void> _eliminarItem(String id, int index) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/historico/$id.json'));

      if (!mounted) return;
      Navigator.pop(context); // Fecha o loading

      if (response.statusCode == 200) {
        setState(() {
          historico.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Substituição eliminada da nuvem!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else {
        throw Exception('Erro ao deletar');
      }
    } catch (e) {
      if (!mounted) return;
      // Fecha o loading apenas se ainda estiver aberto
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao excluir item no servidor.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Substituições',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _carregarHistorico,
            tooltip: 'Atualizar Histórico',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // Carregamento
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.green),
            SizedBox(height: 16),
            Text('Sincronizando com o servidor...'),
          ],
        ),
      );
    }

    // Erro
    if (errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 16),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _carregarHistorico,
                child: const Text('Tentar Novamente'),
              ),
            ],
          ),
        ),
      );
    }

    // Ausência de dados
    if (historico.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma substituição registada na nuvem.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // Sucesso
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: historico.length,
      itemBuilder: (context, index) {
        final item = historico[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12.0),
          child: ListTile(
            leading: const Icon(Icons.cloud_done, color: Colors.green),
            title: Text(
              item['mensagem'] ?? '',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => _eliminarItem(item['id'].toString(), index),
              tooltip: 'Eliminar Registo do Servidor',
            ),
          ),
        );
      },
    );
  }
}
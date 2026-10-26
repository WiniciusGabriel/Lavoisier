import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import '../app_data.dart';
import 'substitution_screen.dart';

class HomePatientScreen extends StatefulWidget {
  const HomePatientScreen({super.key});

  @override
  State<HomePatientScreen> createState() => _HomePatientScreenState();
}

class _HomePatientScreenState extends State<HomePatientScreen> {
  final TextEditingController _buscaController = TextEditingController();
  int _indiceAtual = 0;

  void _onTabTapped(int index) async {
    if (index == 1) {
      await Navigator.pushNamed(context, '/history');
      setState(() {}); 
    } else if (index == 2) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('usuario_email');
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      setState(() { _indiceAtual = index; });
    }
  }

  void _buscarSubstituicao() {
    String busca = _buscaController.text.trim();
    if (busca.isEmpty) return;

    // Procura na tabela o alimento digitado (ignorando maiúsculas/minúsculas)
    var alimentoEncontrado = AppData.tabelaAlimentos.where((item) => 
      item['nome'].toString().toLowerCase().contains(busca.toLowerCase())).toList();

    if (alimentoEncontrado.isNotEmpty) {
      // Abre a tela de substituição enviando o alimento encontrado
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => SubstituicaoScreen(alimentoOriginal: alimentoEncontrado.first),
      )).then((_) => setState(() {})); // Atualiza a economia na tela ao voltar
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alimento não encontrado na base de dados.'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lavoisier - Nutrição e Economia', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Painel de Economia Total
          Card(
            color: Colors.green.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Economia Total Gerada Hoje', style: TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 4),
                  Text('R\$ ${AppData.economiaDoDia.toStringAsFixed(2)}', 
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text('O que está na sua dieta hoje?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Digite o alimento caro prescrito pelo nutricionista para o aplicativo encontrar opções mais baratas com os mesmos nutrientes.'),
          const SizedBox(height: 16),
          
          // Campo de busca interativo
          TextField(
            controller: _buscaController,
            decoration: InputDecoration(
              labelText: 'Ex: Salmão, Patinho, Quinoa...',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send, color: Colors.green),
                onPressed: _buscarSubstituicao,
              ),
            ),
            onSubmitted: (_) => _buscarSubstituicao(),
          ),
        ],
      ),
      // Navegação inferior ergonómica (longe da área de dor)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: _onTabTapped,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Histórico'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sair'),
        ],
      ),
    );
  }
}
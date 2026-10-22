import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Pacote adicionado
import 'login_screen.dart';


class HomePatientScreen extends StatefulWidget {
  const HomePatientScreen({super.key});

  @override
  State<HomePatientScreen> createState() => _HomePatientScreenState();
}

class _HomePatientScreenState extends State<HomePatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plano Nutricional do Dia', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        actions: [
          // Botão original de Histórico
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Ver Histórico',
            onPressed: () => Navigator.pushNamed(context, '/history'),
          ),
          
          IconButton(
            icon: const Icon(Icons.logout),
            color: const Color.fromARGB(255, 93, 85, 85),
            tooltip: 'Sair da Conta',
            // MODIFICADO: Transformado em async para limpar os dados salvos
            onPressed: () async {
              
              // 1. Instancia o SharedPreferences
              final prefs = await SharedPreferences.getInstance();
              
              // 2. REMOVER DADOS: Apaga o e-mail que foi salvo na tela de login
              await prefs.remove('usuario_email');
              
              // 3. Verifica se o widget está montado antes de mudar de tela
              if (mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Card(
            color: Color(0xFFe8f5e9),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Meta Diária', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text('1800 kcal | 140g Proteína', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Refeições de Hoje', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.restaurant, color: Colors.green, size: 32),
              title: const Text('Almoço: Frango com Arroz e Salada', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Toque para ver detalhes e opções de substituição'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/detail'),
            ),
          ),
        ],
      ),
    );
  }
}
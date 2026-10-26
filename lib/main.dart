import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_patient_screen.dart';
import 'screens/history_screen.dart';

void main() {
  runApp(const LavoisierApp());
}

class LavoisierApp extends StatelessWidget {
  const LavoisierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavoisier Nutrição',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      // Define o ecrã inicial como o Login
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomePatientScreen(),
        '/history': (context) => const HistoryScreen(),
        // Nota: A rota '/substitution' foi removida daqui porque agora 
        // ela é chamada passando parâmetros diretamente via Navigator.push na busca.
      },
    );
  }
}
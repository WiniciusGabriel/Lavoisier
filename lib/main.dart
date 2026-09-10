import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_patient_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/substitution_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomePatientScreen(),
        '/detail': (context) => const MealDetailScreen(),
        '/substitution': (context) => const SubstitutionScreen(),
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
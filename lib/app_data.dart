class AppData {
  static List<String> historicoGlobal = [];
  static double economiaDoDia = 0.0;

  // Tabela Nutricional Real (Valores médios por 100g)
  // Preços estimados com base no valor do KG nos supermercados (Ex: Frango R$ 20/kg = R$ 2.00/100g)
  static List<Map<String, dynamic>> tabelaAlimentos = [
    
    // --- PROTEÍNAS ---
    {'nome': 'Salmão', 'categoria': 'proteina', 'calorias': 206, 'proteina': 22.0, 'carbo': 0.0, 'preco': 12.00},
    {'nome': 'Tilápia', 'categoria': 'proteina', 'calorias': 128, 'proteina': 26.0, 'carbo': 0.0, 'preco': 4.00},
    {'nome': 'Patinho (Carne Magra)', 'categoria': 'proteina', 'calorias': 219, 'proteina': 35.0, 'carbo': 0.0, 'preco': 4.50},
    {'nome': 'Peito de Frango', 'categoria': 'proteina', 'calorias': 165, 'proteina': 31.0, 'carbo': 0.0, 'preco': 2.00},
    {'nome': 'Lombo Suíno', 'categoria': 'proteina', 'calorias': 147, 'proteina': 28.0, 'carbo': 0.0, 'preco': 2.50},
    {'nome': 'Ovo Cozido', 'categoria': 'proteina', 'calorias': 155, 'proteina': 13.0, 'carbo': 1.0, 'preco': 1.50},

    // --- CARBOIDRATOS ---
    {'nome': 'Quinoa Cozida', 'categoria': 'carbo', 'calorias': 120, 'proteina': 4.4, 'carbo': 21.0, 'preco': 6.00},
    {'nome': 'Arroz Integral Cozido', 'categoria': 'carbo', 'calorias': 112, 'proteina': 2.6, 'carbo': 23.0, 'preco': 0.80},
    {'nome': 'Macarrão Integral Cozido', 'categoria': 'carbo', 'calorias': 124, 'proteina': 5.3, 'carbo': 26.0, 'preco': 1.20},
    {'nome': 'Mandioca Cozida', 'categoria': 'carbo', 'calorias': 112, 'proteina': 1.3, 'carbo': 27.0, 'preco': 0.60},
    {'nome': 'Batata Doce Cozida', 'categoria': 'carbo', 'calorias': 86, 'proteina': 1.6, 'carbo': 20.0, 'preco': 0.50},
  ];
}
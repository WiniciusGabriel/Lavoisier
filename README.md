1. Nome da aplicação
Lavoisier

2. Problema
Pacientes em acompanhamento nutricional recebem planos alimentares com alimentos específicos, mas no dia a dia frequentemente não têm acesso a esses alimentos (indisponibilidade, custo, restrição alimentar, preferência pessoal). Sem orientação técnica no momento da troca, o paciente costuma substituir de forma intuitiva — o que pode desequilibrar macros e calorias e comprometer o resultado do plano.

3. Objetivo geral
Desenvolver um aplicativo mobile que permita ao paciente substituir um alimento prescrito por um equivalente nutricional, mantendo a proporção de macronutrientes e calorias definida pelo nutricionista.


# Lavoisier - Aplicativo de Substituição Nutricional

## 1. Nome da Aplicação
**Lavoisier**

## 2. Descrição do Problema
Pacientes em acompanhamento nutricional recebem planos alimentares com alimentos específicos, mas no dia a dia frequentemente não têm acesso a esses alimentos (indisponibilidade, custo, restrição alimentar, preferência pessoal). Sem orientação técnica no momento da troca, o paciente costuma substituir de forma intuitiva — o que pode desequilibrar macros e calorias e comprometer o resultado do plano.

## 3. Objetivo Geral
Desenvolver um aplicativo mobile que permita ao paciente substituir um alimento prescrito por um equivalente nutricional, mantendo a proporção de macronutrientes e calorias definida pelo nutricionista.

## 4. Status Atual (Etapa 2 - Implementação do Protótipo)
O projeto conta com a estrutura modular em Flutter implementada e as seguintes telas funcionais integradas via rotas:
* **Tela de Login / Cadastro:** Permite a autenticação e acesso inicial do paciente.
* **Home do Paciente:** Exibe o plano alimentar diário, metas nutricionais e acesso rápido ao histórico.
* **Detalhe da Refeição:** Mostra as informações detalhadas do alimento prescrito e a opção de acionar a troca.
* **Tela de Substituição:** Lista os alimentos equivalentes sugeridos pelo sistema.
* **Histórico de Substituições:** Exibe o registro das trocas alimentares já realizadas pelo usuário.

## 5. Estrutura do Projeto
```text
Lavoisier/
├── docs/
│   ├── arquitetura.md
│   ├── etapa-02.md
│   ├── evidencias.md
│   └── proposta.md
├── lib/
│   ├── screens/
│   │   ├── history_screen.dart
│   │   ├── home_patient_screen.dart
│   │   ├── login_screen.dart
│   │   ├── meal_detail_screen.dart
│   │   └── substitution_screen.dart
│   └── main.dart
└── README.md
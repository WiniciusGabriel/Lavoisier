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

Etapa-03

# Lavoisier - Aplicativo de Substituição Nutricional

## 1. Nome da Aplicação
**Lavoisier**

## 2. Problema
Pacientes em acompanhamento nutricional recebem planos alimentares com alimentos específicos, mas no dia a dia frequentemente não têm acesso a esses alimentos (indisponibilidade, custo, restrição alimentar, preferência pessoal). Sem orientação técnica no momento da troca, o paciente costuma substituir de forma intuitiva — o que pode desequilibrar macros e calorias e comprometer o resultado do plano.

## 3. Objetivo Geral
Desenvolver um aplicativo mobile que permita ao paciente substituir um alimento prescrito por um equivalente nutricional, mantendo a proporção de macronutrientes e calorias definida pelo nutricionista.

## 4. Estrutura de Telas e Navegação Implementada
O aplicativo utiliza rotas nomeadas (`Navigator.pushNamed`) para garantir uma navegação fluida:
* **Tela de Login / Cadastro (`/`):** Autenticação inicial do utilizador.
* **Home do Paciente (`/home`):** Exibe a meta diária de calorias/proteínas e as refeições do dia.
* **Detalhe da Refeição (`/detail`):** Mostra os ingredientes prescritos e respetivos valores nutricionais.
* **Substituição de Alimentos (`/substitution`):** Lista opções equivalentes validadas para a troca do alimento.
* **Histórico de Substituições (`/history`):** Registo de todas as trocas alimentares efetuadas pelo paciente.

## 5. Tecnologias Utilizadas
* **Flutter / Dart** (Framework de desenvolvimento multiplataforma)
* **Material Design** (Componentes de interface e UX)

## 6. Instruções para Execução
1. Certifique-se de ter o Flutter instalado na sua máquina.
2. Abra a pasta raiz do projeto no terminal ou editor (ex: VS Code / Android Studio).
3. Inicie um emulador Android ou ligue um dispositivo físico.
4. Execute o comando para iniciar a aplicação:
   ```bash
   flutter run

## Etapa 04 - Persistência de Dados
Nesta etapa, foi implementado o armazenamento local da aplicação Lavoisier utilizando o pacote `shared_preferences`. A aplicação realiza operações completas de CRUD (Criação, Recuperação, Atualização e Remoção) na memória do dispositivo, garantindo que o e-mail de acesso e o histórico de substituições nutricionais permanecem disponíveis mesmo após o encerramento total da aplicação.

## Etapa 05 - Integração Funcional
Nesta etapa, o projeto atingiu sua primeira versão 100% funcional. A interface em Flutter foi totalmente integrada com um backend em Node.js através de uma API REST. 
Foram implementados fluxos completos de negócio (pesquisa de equivalência nutricional, registro de trocas, cálculo de economia e exclusão de histórico), com tratamento de erros, persistência local e feedback visual.
Para instruções detalhadas de execução e decisões técnicas, consulte o arquivo `docs/etapa-05.md`.
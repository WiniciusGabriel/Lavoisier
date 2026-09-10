# Relatório da Etapa 2 - Implementação do Protótipo

## 1. Identificação das Telas Implementadas
* **Tela de Login / Cadastro:** Permite o acesso inicial do paciente.
* **Home do Paciente:** Exibe o plano alimentar diário e metas nutricionais.
* **Detalhe da Refeição:** Mostra as informações do alimento prescrito e opção de troca.
* **Tela de Substituição:** Lista os alimentos equivalentes sugeridos pelo sistema.
* **Histórico de Substituições:** Exibe o registro das trocas alimentares realizadas.

## 2. Descrição dos Principais Componentes Utilizados
* `Scaffold` e `AppBar` para a estrutura base visual.
* `ListView` e `ListView.builder` para as listagens dinâmicas de refeições e substituições.
* `ElevatedButton` para botões de ação e navegação.
* `TextField` para os campos de entrada de dados no login.

## 3. Identificação dos Componentes Reutilizáveis
* Utilização padronizada de `Card` e `ListTile` para exibição de itens e cards de refeições em diferentes telas.

## 4. Descrição dos Elementos de Entrada de Dados
* Campos de texto (`TextField`) para inserção de e-mail e senha na tela de autenticação.

## 5. Estratégias de Adaptação de Layout
* Uso de componentes flexíveis como `ListView` e `Padding` para garantir que o conteúdo se ajuste corretamente a diferentes resoluções de telas de celulares.

## 6. Instruções para Execução da Aplicação
1. Certifique-se de ter o Flutter instalado.
2. No terminal, execute `flutter pub get` para baixar as dependências.
3. Conecte um dispositivo físico ou emulador e execute `flutter run`.

## 7. Principais Decisões de Interface
* Interface limpa focada na usabilidade rápida do paciente para substituição de itens sem desequilibrar as calorias.

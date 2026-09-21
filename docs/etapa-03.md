# Relatório da Etapa 03 - Lavoisier

## 1. Descrição da Estrutura de Navegação Implementada
O aplicativo utiliza um modelo de navegação baseado em rotas nomeadas (`Navigator.pushNamed`), centralizado no arquivo `main.dart`. O fluxo principal foi concebido para guiar o paciente desde o processo de autenticação até o acompanhamento do plano alimentar diário, permitindo gerir detalhes de refeições, visualizar substituições equivalentes e consultar o histórico de alterações.

## 2. Identificação das Telas e Mecanismos de Acesso
* **Tela de Login / Cadastro (`/`):** Ponto de entrada da aplicação. Permite autenticação do utilizador.
* **Home do Paciente (`/home`):** Exibe o resumo do plano nutricional diário e as refeições do dia. O acesso é feito logo após o login bem-sucedido ou ao retornar das telas internas.
* **Detalhe da Refeição (`/detail`):** Acedida ao selecionar uma refeição na Home. Mostra os ingredientes prescritos e respetivas calorias/macronutrientes.
* **Substituição de Alimentos (`/substitution`):** Acedida através do botão de troca na tela de detalhes, listando opções equivalentes validadas nutricionalmente.
* **Histórico de Substituições (`/history`):** Acedida através do ícone de histórico na barra superior (AppBar) da Home.

## 3. Descrição dos Menus, Abas ou Outros Mecanismos de Navegação Utilizados
* **AppBar Interativa:** Presente nas telas internas, contendo botões de ação rápida para acesso direto ao histórico e setas de retorno nativas.
* **Listas Dinâmicas (`ListView` e `ListView.builder`):** Utilizadas para exibir as refeições diárias, as opções de substituição e os itens de histórico de forma fluida.
* **Navegação em Pilha:** Gestão de ecrãs através de rotas para garantir que o utilizador consiga voltar ao ecrã anterior de forma intuitiva.

## 4. Descrição dos Mecanismos de Feedback Visual Implementados
* **SnackBars:** Mensagens temporárias e flutuantes que informam o sucesso de ações (como "Login efetuado com sucesso!" ou "Substituição realizada com sucesso!").
* **Indicadores de Estado (Cards e Cores):** Cores de destaque (como tons de verde) e cartões elevados que dão feedback imediato sobre a seleção de elementos e metas diárias.

## 5. Descrição das Principais Decisões de UX (Experiência do Utilizador)
* **Hierarquia Visual Clara:** Utilização de fontes em negrito e tamanhos distintos para destacar informações vitais (como calorias e nomes dos alimentos).
* **Minimização de Cliques:** Acesso rápido ao histórico diretamente na barra superior da tela inicial, reduzindo a fricção de navegação.

## 6. Descrição das Medidas de Acessibilidade Implementadas
* **Tamanho de Toque Adequado (Lei de Fitts):** Botões dimensionados com padding vertical generoso para facilitar o toque em diferentes tamanhos de ecrã.
* **Ferramentas de Ajuda (Tooltips):** Ícones de navegação acompanhados de descrições textuais auxiliares para leitores de tela e melhor usabilidade.

## 7. Instruções para Execução e Teste da Navegação
1. Certifique-se de ter o Flutter instalado e um emulador/dispositivo configurado.
2. Abra a pasta raiz do projeto (`Lavoisier`) no terminal.
3. Execute o comando para iniciar a aplicação:
   ```bash
   flutter run
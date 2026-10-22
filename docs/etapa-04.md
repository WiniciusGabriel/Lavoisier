# Documentação da Etapa 04 - Persistência Local

## Mecanismo de persistência utilizado
Foi utilizado o pacote `shared_preferences` do ecossistema Flutter.

## Justificativa da escolha
Para a aplicação Lavoisier, as necessidades de armazenamento resumem-se à preservação da sessão do utilizador (e-mail) e ao registo do histórico de substituições de refeições. Sendo um volume de dados reduzido e de estrutura simples (pares chave-valor e listas de texto puro), o `shared_preferences` oferece a solução mais leve, nativa e de rápida implementação. Evita-se assim a complexidade e a sobrecarga de configurar uma base de dados relacional robusta (como o SQLite), que seria desproporcional para o escopo atual do projeto.

## Estrutura dos dados armazenados
Os dados estão estruturados nativamente em formatos primitivos associados a chaves (keys) de identificação:
*   `usuario_email`: String simples guardando o endereço de e-mail do utilizador autenticado.
*   `historico_refeicoes`: Lista de Strings (`List<String>`) contendo o registro cronológico das trocas de alimentos realizadas pelo paciente.

## Descrição das operações de persistência implementadas
As operações completas de manipulação (CRUD) foram integradas diretamente nas funções assíncronas das telas:
*   **Criação/Armazenamento (Create):** Utilização do método `setString` e `setStringList` para gravar novos dados (ex: submissão de registo na `CadastroScreen` e confirmação de nova troca na `SubstituicaoScreen`).
*   **Recuperação (Read):** Utilização de `getString` e `getStringList` invocados dentro do ciclo de vida `initState()`, garantindo que os dados pré-existentes carregam imediatamente na abertura da `LoginScreen` e da `HistoryScreen`.
*   **Atualização (Update):** Realizada na `SubstituicaoScreen` através da leitura da lista atual em memória, adição do novo item e reescrita integral da lista na mesma chave utilizando `setStringList`.
*   **Remoção (Delete):** Implementada com o método `remove`. Disponível no encerramento de sessão na `HomePatientScreen` (apagando a chave do e-mail) e através da ação de limpar o histórico na `HistoryScreen` (apagando a chave das refeições).

## Identificação das telas (ecrãs) que utilizam os dados
A persistência afeta diretamente o estado das seguintes interfaces:
*   `LoginScreen`: Recupera e apresenta o e-mail previamente guardado.
*   `CadastroScreen`: Cria e armazena o e-mail do novo utilizador.
*   `SubstituicaoScreen`: Cria e atualiza a lista de substituições no dispositivo.
*   `HistoryScreen`: Recupera, apresenta em lista visual e permite remover os registos de trocas.
*   `HomePatientScreen`: Permite a remoção dos dados de acesso (sessão) através do botão de logout.

## Instruções para execução e teste
1. Instalar as dependências executando `flutter pub get` no terminal.
2. Iniciar a depuração num emulador ou dispositivo físico executando `flutter run`.
3. Efetuar um registo ou login para gravar o e-mail em memória.
4. Navegar até ao detalhe da refeição e efetuar uma substituição para gravar o histórico.

## Procedimento utilizado para verificar a persistência
1. Com a aplicação a correr e dados inseridos, abrir o gestor de tarefas nativo do emulador/dispositivo.
2. Forçar o encerramento da aplicação (arrastando a janela para a fechar completamente).
3. Reabrir a aplicação diretamente através do ícone no menu do dispositivo.
4. Confirmar que o campo de e-mail no ecrã de acesso se encontra preenchido e que a lista no ecrã de histórico retém os dados gerados na sessão anterior.
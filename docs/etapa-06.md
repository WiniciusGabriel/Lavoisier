# Documentação da Etapa 6 — Integração com API ou Serviço Externo

## 1. Identificação da API ou Serviço Utilizado
* **Serviço:** Firebase Realtime Database (Google Cloud)
* **Tipo:** Banco de dados NoSQL baseado em nuvem com suporte a API REST nativa.

## 2. Endereço / Base URL do Serviço
* **Base URL:** `https://lavoisier-94c3e-default-rtdb.firebaseio.com`

## 3. Descrição dos Endpoints Utilizados
* **Endpoint de Histórico:** `/historico.json`
  * Utilizado para gerir os registos de substituições alimentares efetuadas pelo utilizador no aplicativo Lavoisier.

## 4. Métodos HTTP Utilizados em Cada Operação
* **POST:** Utilizado na tela `SubstituicaoScreen` para enviar e gravar novas substituições realizadas pelo utilizador.
* **GET:** Utilizado na tela `HistoryScreen` para consultar e recuperar a lista completa de registos salvos na nuvem.
* **DELETE:** Utilizado na tela `HistoryScreen` para remover um registo específico do servidor utilizando o ID único do nó.

## 5. Estrutura dos Dados Trocados (Formato JSON)
* **Envio (POST - Exemplo):**
  ```json
  {
    "mensagem": "Trocaste 100g de Salmão por Ovo Cozido (Poupaste R$10.50)"
  }

  Recebimento (GET - Exemplo):

  {
  "-OAbc123xyz456": {
    "mensagem": "Trocaste 100g de Salmão por Ovo Cozido (Poupaste R$10.50)"
  }
}


Descrição do Fluxo de Comunicação e Tratamento de Estados
Carregamento (isLoading): Exibe um CircularProgressIndicator centralizado na tela enquanto a requisição HTTP assíncrona aguarda resposta da rede.

Sucesso: Renderiza os dados num ListView.builder utilizando componentes visuais limpos (Card e ListTile).

Erro (errorMessage): Captura exceções de rede através de blocos try/catch e apresenta uma mensagem amigável na interface com um botão para "Tentar Novamente".

Ausência de Dados (historico.isEmpty): Identifica listas vazias e exibe um texto informativo indicando que nenhuma substituição foi registada.

Instruções para Executar e Testar a Integração
Certifique-se de que o dispositivo possui conexão com a internet.

Execute a aplicação no navegador Chrome ou app através do comando:

flutter run -d chrome
flutter run -d android

Na tela inicial, pesquise por um alimento (ex: Salmão ou Patinho).

Clique no botão "Trocar" em qualquer alternativa para disparar a operação POST para o Firebase.

Vá até a aba Histórico na barra de navegação inferior para validar a operação GET (consulta) e utilize o ícone de lixeira para testar a operação DELETE (remoção).
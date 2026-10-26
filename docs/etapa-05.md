# Etapa 05 - Primeira Versão Funcional (Integração Frontend e Backend)

## Descrição do fluxo completo de negócio implementado
O fluxo principal desenvolvido consiste na "Substituição Inteligente de Alimentos", cobrindo o ciclo completo de criação, visualização e exclusão. O usuário pesquisa um alimento caro prescrito; o aplicativo cruza os dados com uma tabela nutricional e apresenta opções mais baratas do mesmo grupo alimentar. Ao confirmar a troca, a operação é registrada no backend e o valor economizado é somado. O usuário pode visualizar todas as trocas no "Histórico" e, caso deseje, excluir um registro específico, atualizando a base de dados local.

## Passo a passo para executar o fluxo
1. Iniciar o aplicativo e realizar o login (sessão mantida localmente).
2. Na tela inicial, digitar um alimento válido (ex: "Salmão") no campo de pesquisa.
3. Na tela de Substituições, clicar em "Trocar" na alternativa desejada.
4. Navegar para a aba "Histórico" para visualizar o registro salvo no servidor.
5. Clicar no ícone de lixeira ao lado do item no Histórico para excluí-lo.

## Funcionalidades integradas nesta etapa
* **Frontend Mobile/Web (Flutter):** Interface interativa, gerenciamento de estado, navegação via `BottomNavigationBar` e persistência de sessão.
* **Backend (Node.js/Express):** API REST para gerenciamento do histórico (GET/POST).
* **Lógica de Negócio:** Algoritmo de filtragem e cálculo financeiro baseado em equivalência nutricional.

## Tratamento de entradas inválidas
* **Pesquisas vazias ou não encontradas:** O aplicativo bloqueia pesquisas vazias e exibe alertas visuais (SnackBar) se o alimento não existir na base.
* **Queda de conexão ao servidor:** Try/catch implementado nas chamadas HTTP. Se o servidor falhar, o aplicativo faz fallback automático para a memória local (`AppData`), garantindo que o usuário não perca dados.

## Mecanismos de feedback utilizados
* **SnackBars:** Alertas coloridos (verde para sucesso, vermelho para erros/exclusão).
* **Loading State:** `CircularProgressIndicator` durante chamadas assíncronas ao servidor.
* **UI Dinâmica:** Atualização instantânea (`setState`) dos valores de economia na tela inicial e remoção de itens na lista.

## Principais decisões técnicas realizadas
* **Detecção Automática de Plataforma (`kIsWeb`):** Implementação de rotas dinâmicas para o backend (`localhost` vs `10.0.2.2`) garantindo funcionamento híbrido (Web e Emulador).
* **Fluxo Ativo de UX:** Substituição de navegação estática por um motor de busca dinâmico, realocando ações principais para a base da tela (BottomNavigationBar).

## Instruções para execução e teste
1. Na pasta `backend`, executar `node server.js` (porta 3000).
2. Na raiz do projeto, executar `flutter run -d chrome` (Web) ou `flutter run` (Emulador Android).
3. Testar a pesquisa, a realização da troca e, por fim, a exclusão na tela de histórico.
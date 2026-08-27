1. Nome da aplicação
Lavoisier

2. Problema
Pacientes em acompanhamento nutricional recebem planos alimentares com alimentos específicos, mas no dia a dia frequentemente não têm acesso a esses alimentos (indisponibilidade, custo, restrição ou preferência). Sem orientação técnica no momento da troca, a substituição costuma ser feita de forma intuitiva, o que pode desequilibrar macros e calorias e comprometer o plano.

3. Público-alvo
Pacientes adultos em acompanhamento nutricional e nutricionistas responsáveis por prescrever e acompanhar os planos alimentares.

4. Objetivo principal
Desenvolver um aplicativo mobile que permita ao paciente substituir um alimento prescrito por um equivalente nutricional, mantendo a proporção de macronutrientes e calorias definida pelo nutricionista.

5. Principais funcionalidades

Cadastro/login separado por perfil (paciente e nutricionista)
Cadastro do plano alimentar pelo nutricionista
Visualização do plano alimentar pelo paciente
Consulta de alimentos e composição nutricional
Sugestão de substituição baseada em equivalência de macros/calorias
Histórico de substituições realizadas

6. Telas previstas (mínimo 4)

Login / Cadastro
Home do Paciente (plano alimentar do dia)
Detalhe da Refeição (com opção "substituir alimento")
Substituição (lista de alimentos equivalentes sugeridos)
Histórico de Substituições

7. Fluxo básico de navegação
Login → Home (plano do dia) → toca em uma refeição → Detalhe da Refeição → botão "substituir" → Tela de Substituição → confirma escolha → volta ao Detalhe atualizado → Histórico acessível pelo menu.

8. Tecnologia mobile
Flutter (Dart) — escolhido por ser mais acessível pra quem está começando.

9. Tecnologia de backend
Node.js + Express. API REST simples pra servir dados de plano alimentar, alimentos e substituições.

10. Comunicação com APIs externas
Não será necessária nesta primeira versão. A base de alimentos e valores nutricionais será populada localmente no próprio banco (por exemplo, com base na tabela TACO), o que simplifica o escopo acadêmico. Dá pra citar isso como "trabalho futuro" na proposta, se quiser.

11. Armazenamento de dados
PostgreSQL rodando em container Docker, orquestrado via Docker Compose junto com o backend Node.js — facilita o setup do ambiente e a entrega do projeto.

12. Repositório Git
https://github.com/WiniciusGabriel/Lavoisier.git

13. Estrutura de diretórios
README.md
docs src tests
docs/proposta.md docs/arquitetura.md docs/evidencias.md
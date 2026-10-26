const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// Banco de dados em memória (para a entrega funcional, depois podes migrar para PostgreSQL)
let historicoSubstituicoes = [
  "Troca inicial de teste: Arroz por Batata Doce"
];

// Rota para LER o histórico (GET)
app.get('/api/historico', (req, res) => {
  res.json(historicoSubstituicoes);
});

// Rota para CRIAR uma nova substituição (POST)
app.post('/api/historico', (req, res) => {
  const { mensagem } = req.body;
  if (!mensagem) {
    return res.status(400).json({ erro: 'Mensagem é obrigatória' });
  }
  
  historicoSubstituicoes.push(mensagem);
  res.status(201).json({ sucesso: true, mensagem: 'Substituição registada com sucesso!' });
});

// Rota para LIMPAR o histórico (DELETE)
app.delete('/api/historico', (req, res) => {
  historicoSubstituicoes = [];
  res.json({ sucesso: true, mensagem: 'Histórico limpo.' });
});

const PORT = 3000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Backend a correr na porta ${PORT}`);
});
# API de Produtos - Guia do Desenvolvedor

## 🚀 Visão Geral Técnica

Este projeto implementa uma API RESTful para gerenciamento de produtos utilizando FastAPI e PostgreSQL. O sistema inclui testes automatizados e um pipeline de CI/CD usando GitHub Actions.

### Arquitetura

- **Backend**: FastAPI (Python 3.9+)
- **Banco de Dados**: PostgreSQL
- **Containerização**: Docker
- **CI/CD**: GitHub Actions
- **Testes**: Pytest

### Diagrama de Arquitetura

```
+------------------+     +------------------+     +------------------+
|                  |     |                  |     |                  |
|  Cliente HTTP    |     |  GitHub Actions  |     |   Docker Hub     |
|  (Swagger/ReDoc) |     |  (CI/CD)         |     |   (Registry)     |
|                  |     |                  |     |                  |
+--------+---------+     +--------+---------+     +--------+---------+
         |                        |                        |
         v                        v                        v
+--------+---------+     +--------+---------+     +--------+---------+
|                  |     |                  |     |                  |
|  FastAPI Server  +<--->+  PostgreSQL DB   |     |  Docker Image    |
|  (Python)        |     |  (Container)     |     |  (Container)     |
|                  |     |                  |     |                  |
+------------------+     +------------------+     +------------------+
        ^                        ^
        |                        |
        v                        v
+------------------+     +------------------+
|                  |     |                  |
|  Testes Pytest   |     |  Monitoramento   |
|  (Automáticos)   |     |  (Logs/Métricas) |
|                  |     |                  |
+------------------+     +------------------+

Fluxo de Dados:
1. Cliente -> FastAPI: Requisições HTTP
2. FastAPI <-> PostgreSQL: Operações CRUD
3. GitHub Actions: Pipeline de CI/CD
4. Docker Hub: Armazenamento de imagens
5. Pytest: Testes automatizados
6. Monitoramento: Logs e métricas
```

## 📋 Estrutura do Código

```
.
├── .github/
│   └── workflows/
│       └── docker-publish.yml    # Pipeline de CI/CD
├── main.py                       # Implementação da API
├── test_api.py                   # Testes automatizados
├── requirements.txt              # Dependências Python
└── README.md                     # Documentação geral
```

## 🔧 Configuração do Ambiente de Desenvolvimento

### 1. Pré-requisitos

```bash
# Verificar versão do Python
python --version  # Deve ser 3.9 ou superior

# Verificar Docker
docker --version

# Verificar PostgreSQL
psql --version
```

### 2. Configuração do Ambiente Virtual

```bash
# Criar ambiente virtual
python -m venv venv

# Ativar ambiente (Linux/Mac)
source venv/bin/activate

# Ativar ambiente (Windows)
.\venv\Scripts\activate
```

### 3. Instalação de Dependências

```bash
# Atualizar pip
python -m pip install --upgrade pip

# Instalar dependências
pip install -r requirements.txt
```

### 4. Configuração do Banco de Dados

```bash
# Iniciar PostgreSQL via Docker
docker run --name produtos-db \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=produtos_db \
  -p 5432:5432 \
  -d postgres
```

### 5. Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/produtos_db
```

## 🧪 Executando os Testes

### Testes Locais

```bash
# Executar todos os testes
pytest test_api.py -v

# Executar testes específicos
pytest test_api.py::TestAPI::test_criar_produto -v
```

### Testes no CI/CD

Os testes são executados automaticamente no GitHub Actions em:
- Push para a branch `main`
- Pull requests para a branch `main`

## 🔄 Pipeline de CI/CD

### 1. Job de Testes
- Configura ambiente Python 3.9
- Instala dependências
- Inicia PostgreSQL
- Executa testes

### 2. Job de Build e Push
- Constrói imagem Docker
- Faz push para Docker Hub
- Utiliza cache para builds mais rápidos

## 🐳 Desenvolvimento com Docker

### Construção da Imagem

```bash
# Construir imagem
docker build -t api-produtos .

# Verificar imagens
docker images
```

### Execução do Container

```bash
# Executar container
docker run -p 8000:8000 \
  --env-file .env \
  --name api-produtos \
  api-produtos

# Verificar logs
docker logs api-produtos
```

## 📚 Documentação da API

### Swagger UI
- URL: `http://localhost:8000/docs`
- Documentação interativa
- Teste de endpoints

### ReDoc
- URL: `http://localhost:8000/redoc`
- Documentação alternativa
- Interface mais limpa

## 🔍 Debugging

### Logs da Aplicação
```bash
# Ver logs do container
docker logs api-produtos

# Ver logs em tempo real
docker logs -f api-produtos
```

### Banco de Dados
```bash
# Acessar PostgreSQL
docker exec -it produtos-db psql -U postgres -d produtos_db

# Listar tabelas
\dt

# Consultar produtos
SELECT * FROM produtos;
```

## 🤝 Contribuição

### Fluxo de Trabalho

1. Criar branch a partir de `main`
```bash
git checkout -b feature/nova-funcionalidade
```

2. Desenvolver e testar localmente
```bash
# Executar testes
pytest test_api.py -v

# Verificar linting
flake8 .
```

3. Commitar mudanças
```bash
git add .
git commit -m "feat: adiciona nova funcionalidade"
```

4. Push e Pull Request
```bash
git push origin feature/nova-funcionalidade
```

### Convenções

- Commits seguem o padrão Conventional Commits
- Código segue PEP 8
- Testes são obrigatórios para novas funcionalidades

## 🐛 Troubleshooting

### Problemas Comuns

1. **Erro de Conexão com Banco de Dados**
   - Verificar se PostgreSQL está rodando
   - Confirmar credenciais no `.env`
   - Testar conexão manualmente

2. **Falha nos Testes**
   - Verificar logs do PostgreSQL
   - Confirmar variáveis de ambiente
   - Executar testes localmente

3. **Problemas com Docker**
   - Limpar containers antigos
   - Reconstruir imagens
   - Verificar portas em uso

## 📞 Suporte

Para questões técnicas:
- Abrir issue no GitHub
- Consultar documentação
- Verificar logs de erro 
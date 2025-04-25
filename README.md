# API de Produtos

Esta é uma API RESTful para gerenciamento de produtos, desenvolvida com FastAPI e PostgreSQL.

## Pré-requisitos

- Python 3.8+ (para desenvolvimento local)
- Docker (para rodar em container)
- PostgreSQL instalado e rodando
- pip (gerenciador de pacotes Python)

## Configuração do Ambiente

### Desenvolvimento Local

1. Criar ambiente virtual:
```bash
python -m venv venv
```

2. Ativar o ambiente virtual:
```bash
source venv/bin/activate
```

3. Instalar dependências:
```bash
pip install -r requirements.txt
```

### Docker

1. Construir a imagem:
```bash
docker build -t api-produtos .
```

2. Rodar o container:
```bash
docker run -p 8000:8000 --env-file .env api-produtos
```

## Configuração do Banco de Dados

1. Criar um banco de dados PostgreSQL:
```bash
createdb produtos_db
```

2. Executar o script SQL para criar a tabela:
```bash
psql produtos_db < data/script.sql
```

3. Configurar as variáveis de ambiente:
Crie um arquivo `.env` na raiz do projeto com o seguinte conteúdo:
```
DB_HOST=switchback.proxy.rlwy.net
DB_PORT=42863
DB_NAME=railway
DB_USER=postgres
DB_PASSWORD=dLCeoAesqfVOTcsqxqQAgPbioBodSBDW
```

## Iniciando o Servidor

### Desenvolvimento Local
Para iniciar o servidor de desenvolvimento:
```bash
uvicorn main:app --reload
```

### Docker
Se estiver usando Docker, o servidor já será iniciado automaticamente quando o container for executado.

A API estará disponível em: http://localhost:8000

## Documentação da API

A documentação interativa da API está disponível em:
- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## Exemplos de Uso

### 1. Criar um novo produto (POST)
```bash
curl -X POST "http://localhost:8000/produtos/" \
     -H "Content-Type: application/json" \
     -d '{
           "nome": "Produto Teste",
           "preco": 99.99,
           "data_validade": "2024-12-31",
           "codigo_barras": "1234567890123"
         }'
```

### 2. Listar todos os produtos (GET)
```bash
curl -X GET "http://localhost:8000/produtos/"
```

### 3. Buscar produto por ID (GET)
```bash
curl -X GET "http://localhost:8000/produtos/1"
```

### 4. Atualizar produto (PUT)
```bash
curl -X PUT "http://localhost:8000/produtos/1" \
     -H "Content-Type: application/json" \
     -d '{
           "nome": "Produto Atualizado",
           "preco": 149.99,
           "data_validade": "2025-12-31",
           "codigo_barras": "9876543210123"
         }'
```

### 5. Excluir produto (DELETE)
```bash
curl -X DELETE "http://localhost:8000/produtos/1"
```

## Respostas de Exemplo

### Criar Produto (POST)
```json
{
  "id": 1,
  "nome": "Produto Teste",
  "preco": 99.99,
  "data_validade": "2024-12-31",
  "codigo_barras": "1234567890123"
}
```

### Listar Produtos (GET)
```json
[
  {
    "id": 1,
    "nome": "Produto Teste",
    "preco": 99.99,
    "data_validade": "2024-12-31",
    "codigo_barras": "1234567890123"
  }
]
```

### Buscar Produto (GET)
```json
{
  "id": 1,
  "nome": "Produto Teste",
  "preco": 99.99,
  "data_validade": "2024-12-31",
  "codigo_barras": "1234567890123"
}
```

### Atualizar Produto (PUT)
```json
{
  "id": 1,
  "nome": "Produto Atualizado",
  "preco": 149.99,
  "data_validade": "2025-12-31",
  "codigo_barras": "9876543210123"
}
```

### Excluir Produto (DELETE)
```json
{
  "message": "Produto excluído com sucesso"
}
``` 
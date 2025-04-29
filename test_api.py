import requests
import json
import pytest
from datetime import date

# URL base da API
BASE_URL = "http://localhost:8000"

# Dados do produto para teste
produto_teste = {
    "nome": "Produto de Teste",
    "preco": 99.99,
    "data_validade": "2024-12-31",
    "codigo_barras": "1234567890123"
}

# Dados atualizados do produto
dados_atualizados = {
    "nome": "Produto de Teste Atualizado",
    "preco": 149.99,
    "data_validade": "2025-12-31",
    "codigo_barras": "9876543210123"
}

class TestAPI:
    @pytest.fixture
    def produto_id(self):
        # Criar um produto para teste
        response = requests.post(f"{BASE_URL}/produtos/", json=produto_teste)
        assert response.status_code == 200
        produto = response.json()
        yield produto["id"]
        # Limpeza após o teste
        requests.delete(f"{BASE_URL}/produtos/{produto['id']}")

    def test_criar_produto(self):
        response = requests.post(f"{BASE_URL}/produtos/", json=produto_teste)
        assert response.status_code == 200
        produto = response.json()
        assert produto["nome"] == produto_teste["nome"]
        assert produto["preco"] == produto_teste["preco"]
        # Limpeza
        requests.delete(f"{BASE_URL}/produtos/{produto['id']}")

    def test_listar_produtos(self, produto_id):
        response = requests.get(f"{BASE_URL}/produtos/")
        assert response.status_code == 200
        produtos = response.json()
        assert isinstance(produtos, list)
        assert len(produtos) > 0

    def test_buscar_produto(self, produto_id):
        response = requests.get(f"{BASE_URL}/produtos/{produto_id}")
        assert response.status_code == 200
        produto = response.json()
        assert produto["id"] == produto_id
        assert produto["nome"] == produto_teste["nome"]

    def test_atualizar_produto(self, produto_id):
        response = requests.put(f"{BASE_URL}/produtos/{produto_id}", json=dados_atualizados)
        assert response.status_code == 200
        produto = response.json()
        assert produto["nome"] == dados_atualizados["nome"]
        assert produto["preco"] == dados_atualizados["preco"]

    def test_deletar_produto(self, produto_id):
        response = requests.delete(f"{BASE_URL}/produtos/{produto_id}")
        assert response.status_code == 200
        # Verificar se o produto foi realmente deletado
        response = requests.get(f"{BASE_URL}/produtos/{produto_id}")
        assert response.status_code == 404 
import requests
import json
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

def test_api():
    print("=== Teste da API de Produtos ===")
    
    # 1. Criar um novo produto
    print("\n1. Criando um novo produto...")
    response = requests.post(f"{BASE_URL}/produtos/", json=produto_teste)
    produto_criado = response.json()
    print(f"Produto criado: {json.dumps(produto_criado, indent=2)}")
    produto_id = produto_criado["id"]
    
    # 2. Listar todos os produtos
    print("\n2. Listando todos os produtos...")
    response = requests.get(f"{BASE_URL}/produtos/")
    produtos = response.json()
    print(f"Produtos encontrados: {json.dumps(produtos, indent=2)}")
    
    # 3. Buscar produto por ID
    print(f"\n3. Buscando produto com ID {produto_id}...")
    response = requests.get(f"{BASE_URL}/produtos/{produto_id}")
    produto = response.json()
    print(f"Produto encontrado: {json.dumps(produto, indent=2)}")
    
    # 4. Atualizar o produto
    print(f"\n4. Atualizando produto com ID {produto_id}...")
    response = requests.put(f"{BASE_URL}/produtos/{produto_id}", json=dados_atualizados)
    produto_atualizado = response.json()
    print(f"Produto atualizado: {json.dumps(produto_atualizado, indent=2)}")
    
    # 5. Verificar se o produto foi atualizado
    print(f"\n5. Verificando se o produto foi atualizado...")
    response = requests.get(f"{BASE_URL}/produtos/{produto_id}")
    produto_verificado = response.json()
    print(f"Produto após atualização: {json.dumps(produto_verificado, indent=2)}")
    
    # 6. Deletar o produto
    print(f"\n6. Deletando produto com ID {produto_id}...")
    response = requests.delete(f"{BASE_URL}/produtos/{produto_id}")
    resultado = response.json()
    print(f"Resultado da exclusão: {json.dumps(resultado, indent=2)}")
    
    # 7. Verificar se o produto foi realmente deletado
    print(f"\n7. Verificando se o produto foi deletado...")
    response = requests.get(f"{BASE_URL}/produtos/{produto_id}")
    if response.status_code == 404:
        print("Produto não encontrado (como esperado após a exclusão)")
    else:
        print("ERRO: Produto ainda existe!")

if __name__ == "__main__":
    test_api() 
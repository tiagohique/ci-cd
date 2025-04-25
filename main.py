from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import psycopg2
from psycopg2.extras import RealDictCursor
import os
from dotenv import load_dotenv
from typing import List, Optional
from datetime import date

# Carrega as variáveis de ambiente
load_dotenv()

app = FastAPI(title="API de Produtos")

# Configurações do banco de dados
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

# Modelo Pydantic para validação de entrada/saída
class ProdutoBase(BaseModel):
    nome: str
    preco: float
    data_validade: Optional[date] = None
    codigo_barras: Optional[str] = None

class ProdutoCreate(ProdutoBase):
    pass

class Produto(ProdutoBase):
    id: int

    class Config:
        from_attributes = True

# Função para obter conexão com o banco de dados
def get_db_connection():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            cursor_factory=RealDictCursor
        )
        return conn
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        raise

@app.post("/produtos/", response_model=Produto)
def criar_produto(produto: ProdutoCreate):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            """
            INSERT INTO produtos (nome, preco, data_validade, codigo_barras)
            VALUES (%s, %s, %s, %s)
            RETURNING id, nome, preco, data_validade, codigo_barras
            """,
            (produto.nome, produto.preco, produto.data_validade, produto.codigo_barras)
        )
        novo_produto = cur.fetchone()
        conn.commit()
        return novo_produto
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cur.close()
        conn.close()

@app.get("/produtos/", response_model=List[Produto])
def listar_produtos():
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("SELECT * FROM produtos")
        produtos = cur.fetchall()
        return produtos
    finally:
        cur.close()
        conn.close()

@app.get("/produtos/{produto_id}", response_model=Produto)
def buscar_produto(produto_id: int):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("SELECT * FROM produtos WHERE id = %s", (produto_id,))
        produto = cur.fetchone()
        if produto is None:
            raise HTTPException(status_code=404, detail="Produto não encontrado")
        return produto
    finally:
        cur.close()
        conn.close()

@app.put("/produtos/{produto_id}", response_model=Produto)
def atualizar_produto(produto_id: int, produto: ProdutoCreate):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            """
            UPDATE produtos
            SET nome = %s, preco = %s, data_validade = %s, codigo_barras = %s
            WHERE id = %s
            RETURNING id, nome, preco, data_validade, codigo_barras
            """,
            (produto.nome, produto.preco, produto.data_validade, produto.codigo_barras, produto_id)
        )
        produto_atualizado = cur.fetchone()
        if produto_atualizado is None:
            raise HTTPException(status_code=404, detail="Produto não encontrado")
        conn.commit()
        return produto_atualizado
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cur.close()
        conn.close()

@app.delete("/produtos/{produto_id}")
def excluir_produto(produto_id: int):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("DELETE FROM produtos WHERE id = %s RETURNING id", (produto_id,))
        produto_excluido = cur.fetchone()
        if produto_excluido is None:
            raise HTTPException(status_code=404, detail="Produto não encontrado")
        conn.commit()
        return {"message": "Produto excluído com sucesso"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cur.close()
        conn.close() 
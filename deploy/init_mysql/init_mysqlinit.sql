-- Criação do banco de dados se não existir
CREATE DATABASE IF NOT EXISTS exemplo_mysql;

-- Usa o banco de dados
USE exemplo_mysql;

-- Criação da tabela de exemplo
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo dados de exemplo
INSERT INTO usuarios (nome, email) VALUES ('Carlos Silva', 'carlos@exemplo.com');
INSERT INTO usuarios (nome, email) VALUES ('Maria Oliveira', 'maria@exemplo.com');

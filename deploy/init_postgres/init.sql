-- Criação da tabela de exemplo (o banco já foi criado via variável POSTGRES_DB)
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo dados de exemplo
INSERT INTO usuarios (nome, email) VALUES ('Carlos Silva', 'carlos@exemplo.com');
INSERT INTO usuarios (nome, email) VALUES ('Maria Oliveira', 'maria@exemplo.com');

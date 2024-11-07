-- Criação do banco de dados
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'exemplo_sqlserver')
BEGIN
    CREATE DATABASE exemplo_sqlserver;
END
GO

-- Seleciona o banco de dados
USE exemplo_sqlserver;
GO

-- Criação da tabela de exemplo
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='usuarios' AND xtype='U')
BEGIN
    CREATE TABLE usuarios (
        id INT IDENTITY(1,1) PRIMARY KEY,
        nome NVARCHAR(50) NOT NULL,
        email NVARCHAR(100) NOT NULL UNIQUE,
        data_criacao DATETIME DEFAULT GETDATE()
    );
END
GO

-- Inserindo dados de exemplo
INSERT INTO usuarios (nome, email) VALUES ('Carlos Silva', 'carlos@exemplo.com');
INSERT INTO usuarios (nome, email) VALUES ('Maria Oliveira', 'maria@exemplo.com');
GO

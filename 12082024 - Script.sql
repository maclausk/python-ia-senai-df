-- MODELO FÍSICO - 12082024 - Script.sql
CREATE DATABASE IF NOT EXISTS riscocredito;
USE riscocredito;

CREATE TABLE Pessoa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idade_pessoa INT NOT NULL,  -- Idade da pessoa
    renda_pessoa DECIMAL(15, 2) NOT NULL,  -- Renda da pessoa
    propriedade_residencial VARCHAR(50) NOT NULL,  -- Tipo de propriedade residencial (Ex: 'Aluguel', 'Própria')
    tempo_emprego INT NOT NULL  -- Tempo de emprego em anos
);

CREATE TABLE Emprestimo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    intencao_emprestimo VARCHAR(50) NOT NULL,  -- Finalidade do empréstimo (Ex: 'Carro', 'Educação')
    valor_emprestimo DECIMAL(15, 2) NOT NULL,  -- Valor do empréstimo
    status_emprestimo VARCHAR(20) NOT NULL,  -- Status do empréstimo (Ex: 'Em Dia', 'Atrasado')
    percentual_renda_emprestimo DECIMAL(5, 2) NOT NULL,  -- Percentual da renda comprometido com o empréstimo
    registro_inadimplencia CHAR(1) NOT NULL,  -- Registro de inadimplência ('S' ou 'N')
    tempo_historico_credito INT NOT NULL,  -- Tempo de histórico de crédito em anos
    pessoa_id INT,  -- Chave estrangeira que referencia a tabela Pessoa
    FOREIGN KEY (pessoa_id) REFERENCES Pessoa(id)
);

CREATE TABLE HistoricoCredito (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_id INT,  -- Chave estrangeira que referencia a tabela Pessoa
    emprestimo_id INT,  -- Chave estrangeira que referencia a tabela Emprestimo
    historico_credito VARCHAR(50) NOT NULL,  -- Detalhes adicionais do histórico de crédito
    FOREIGN KEY (pessoa_id) REFERENCES Pessoa(id),
    FOREIGN KEY (emprestimo_id) REFERENCES Emprestimo(id)
);

-- FIM MODELO FÍSICO - 12082024 - Script.sql

-- Exemplo de preenchimento de dados na tabela Pessoa
INSERT INTO Pessoa (idade_pessoa, renda_pessoa, propriedade_residencial, tempo_emprego)
VALUES (35, 55000.00, 'Propria', 10),
       (29, 42000.00, 'Aluguel', 5),
       (45, 75000.00, 'Hipoteca', 20);

-- Exemplo de preenchimento de dados na tabela Emprestimo
INSERT INTO Emprestimo (intencao_emprestimo, valor_emprestimo, status_emprestimo, percentual_renda_emprestimo, registro_inadimplencia, tempo_historico_credito, pessoa_id)
VALUES ('Carro', 15000.00, 'Em Dia', 27.27, 'N', 12, 1),
       ('Educação', 20000.00, 'Atrasado', 47.62, 'S', 8, 2),
       ('Casa', 50000.00, 'Totalmente Pago', 66.67, 'N', 15, 3);

-- Exemplo de preenchimento de dados na tabela HistoricoCredito
INSERT INTO HistoricoCredito (pessoa_id, emprestimo_id, historico_credito)
VALUES (1, 1, 'Histórico Limpo'),
       (2, 2, 'Histórico com Inadimplências'),
       (3, 3, 'Histórico Bom');
       
-- Consultas Auxiliares

-- 1. Listar todas as pessoas e seus empréstimos | Essa consulta retorna a idade, renda e detalhes dos empréstimos de todas as pessoas na base de dados.
SELECT p.idade_pessoa, p.renda_pessoa, e.intencao_emprestimo, e.valor_emprestimo, e.status_emprestimo
FROM Pessoa p
JOIN Emprestimo e ON p.id = e.pessoa_id;

-- 2. Encontrar pessoas com renda acima da média | Retorna as pessoas cuja renda é maior que a média de todas as pessoas no banco de dados.
SELECT p.idade_pessoa, p.renda_pessoa, e.valor_emprestimo, e.status_emprestimo
FROM Pessoa p
JOIN Emprestimo e ON p.id = e.pessoa_id
WHERE p.renda_pessoa > (SELECT AVG(renda_pessoa) FROM Pessoa);

-- 3. Pessoas com histórico de inadimplência e empréstimo em atraso | 3. Pessoas com histórico de inadimplência e empréstimo em atraso
SELECT p.idade_pessoa, p.renda_pessoa, e.intencao_emprestimo, e.status_emprestimo, hc.historico_credito
FROM Pessoa p
JOIN Emprestimo e ON p.id = e.pessoa_id
JOIN HistoricoCredito hc ON p.id = hc.pessoa_id
WHERE e.status_emprestimo = 'Atrasado' AND hc.historico_credito = 'Histórico com Inadimplências';

-- 4. Contar o número de pessoas com propriedade própria e sem inadimplência | Conta quantas pessoas possuem uma residência própria e não têm registro de inadimplência.
SELECT COUNT(*) AS total_pessoas
FROM Pessoa p
JOIN Emprestimo e ON p.id = e.pessoa_id
WHERE p.propriedade_residencial = 'Propria' AND e.registro_inadimplencia = 'N';

-- 5. Risco de crédito por finalidade do empréstimo | Esta consulta agrupa os empréstimos por finalidade e mostra quantos estão atrasados e quantos foram totalmente pagos.
SELECT e.intencao_emprestimo, COUNT(*) AS total_emprestimos,
       SUM(CASE WHEN e.status_emprestimo = 'Atrasado' THEN 1 ELSE 0 END) AS emprestimos_atrasados,
       SUM(CASE WHEN e.status_emprestimo = 'Totalmente Pago' THEN 1 ELSE 0 END) AS emprestimos_pagos
FROM Emprestimo e
GROUP BY e.intencao_emprestimo;

-- 6. Histórico de crédito e status dos empréstimos | Mostra o número de empréstimos por tipo de histórico de crédito e status do empréstimo.
SELECT hc.historico_credito, e.status_emprestimo, COUNT(*) AS total
FROM HistoricoCredito hc
JOIN Emprestimo e ON hc.emprestimo_id = e.id
GROUP BY hc.historico_credito, e.status_emprestimo;

-- 7. Consulta de pessoas com alto comprometimento da renda | Encontra pessoas cujo percentual da renda comprometido com o empréstimo é superior a 50%.
SELECT p.idade_pessoa, p.renda_pessoa, e.valor_emprestimo, e.percentual_renda_emprestimo
FROM Pessoa p
JOIN Emprestimo e ON p.id = e.pessoa_id
WHERE e.percentual_renda_emprestimo > 50;

-- 8. Listar pessoas com mais de 10 anos de histórico de crédito | Lista as pessoas que têm mais de 10 anos de histórico de crédito, mostrando também o status do empréstimo.
SELECT p.idade_pessoa, p.renda_pessoa, e.tempo_historico_credito, e.status_emprestimo
FROM Pessoa p
JOIN Emprestimo e ON p.id = e.pessoa_id
WHERE e.tempo_historico_credito > 10;
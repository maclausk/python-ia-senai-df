-- DDL (Data Definition Language)
-- Linguagem de Definição de Dados 
   -- CREATE
   -- DROP
   -- ALTER
   
-- DML (Data Manipulation Language)

   -- INSERT
   -- UPDATE
   -- DELETE

-- DQL (Data Query Language)
   -- Linguagem de Pesquisa de dados
	  -- SELECT 
      -- WHERE
      -- FROM
      -- >  <   >= =  AND

-- DCL (Data Control Language)
     --  Linguagem de controle de dados
     -- CRIAR USUÁRIOS
     -- Tarefas de ADMIN
     -- Grant
     -- Revoke

-- DTL (Data Transaction Language)
    -- Transações
    
    -- BEGIN TRAN (OU BEGIN TRANSACTION) – Marca o começo de uma transação no banco da dados  que pode ser completada ou não.
    -- COMMIT – Envia todos os dados da transação permanentemente para o banco de dados.
    -- ROLLBACK – Desfaz as alterações feitas na transação realizada.
    

-- DDL: CREATE DATABASE (criar um banco de dados)
-- Cria e atualiza o navegador, para aparecer a database criada
CREATE DATABASE schooltracker;
-- Selecionar o banco de dados desejado
USE schooltracker;
-- Mostrar tabelas
SHOW tables;

-- CÓDIGO IMPORTADO DO BRMODELO

-- diferença entre show e describe? 
CREATE TABLE Aluno (
    id int PRIMARY KEY auto_increment,
    ra char(8) NOT NULL
);

-- Informações sobre a tabela, estrutura, campos que tem.
DESCRIBE aluno;
-- INSERT 
INSERT aluno(ra)values('000345'); -- eu vou inserir na tabela aluno, no campo RA o valor 00034549
INSERT aluno(ra)values('003456');
-- O ID para registro pq não precisa, já que ele foi definido como auto incremental, vai automático
show tables

SELECT * FROM aluno;

CREATE TABLE diariobordo (
    id int PRIMARY KEY auto_increment,
    texto text NOT NULL,
    datahora datetime,
    fk_Aluno_id int -- fk é um atributo de chave estrangeira, fk. Mas o banco de dados não entende que esse atributo é relacionado a outra tabela.
    -- SE esse atributo é uma chave estrangeira, deve ser adicinada uma constraint, uma FOREIGN KEY, que é que vai definir que esse atributo tem vinculado com a atabela aluno.
    -- 
);
 
SELECT * FROM diariobordo; -- visualizar tabela criada


ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2 -- alterando a tabela diario de bordo adicionando uma chave esrangeira nomeada de diariobordo_2
    FOREIGN KEY (fk_Aluno_id) -- definindo o campo da chave estrangeira
    REFERENCES Aluno (id) -- Eu vou referenciar o ID da tabela aluno com o fk_aluno_id. Está referenciada a chave estrageira fk_aluno_id
    ON DELETE CASCADE; -- 1,1 obrigatório, tem que existir o aluno para existir o diário. Deletar registro em cascata.
    
-- inserir os dados na tabela diariodebordo


-- aula de amanha vamos fazer INSERT com o ia gpt (copilot e gemini)
Conectar com o banco de dados usando python
sqlAlchemy - ORM
pymysql
connection string
select em um notebook jupyter
enviar consultas para o dataframe usando pd.read_sql(query)
EDA (analise exploratória)
insert do diario de bordo (sem IA, manual)
DELETE
UPDATE
SELECT WHERE
select join como funciona, LEF JOIN, RIGHT JOIN, INNER JOIN)
ENCERRAR NOSSO MINI CURSO DE BANCO DE DADOS



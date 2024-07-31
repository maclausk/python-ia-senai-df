-- Criação do banco de dados
CREATE DATABASE schooltracker;
-- CREATE DATABASE: Cria um novo banco de dados chamado `schooltracker`.

-- Seleção do banco de dados
USE schooltracker;
-- USE schooltracker: Seleciona o banco de dados `schooltracker` para uso.

-- Criação da tabela aluno com auto incremento no ID
CREATE TABLE Aluno (
    id int PRIMARY KEY auto_increment,
    ra char(8) NOT NULL
);
-- CREATE TABLE Aluno: Cria uma nova tabela chamada `Aluno`.
-- id int PRIMARY KEY auto_increment: Cria uma coluna `id` que é um número inteiro, chave primária e auto incrementada.
-- ra char(8) NOT NULL: Cria uma coluna `ra` que é um conjunto de 8 caracteres e não pode ser nula.

-- Criação da tabela diariobordo com auto incremento no ID
CREATE TABLE diariobordo (
    id int PRIMARY KEY auto_increment,
    texto text NOT NULL,
    datahora datetime,
    fk_Aluno_id int
);
-- CREATE TABLE diariobordo: Cria uma nova tabela chamada `diariobordo`.
-- id int PRIMARY KEY auto_increment: Cria uma coluna `id` que é um número inteiro, chave primária e auto incrementada.
-- texto text NOT NULL: Cria uma coluna `texto` que é um campo de texto e não pode ser nula.
-- datahora datetime: Cria uma coluna `datahora` que armazena data e hora.
-- fk_Aluno_id int: Cria uma coluna `fk_Aluno_id` que é um número inteiro, destinada a armazenar a chave estrangeira que se relaciona com a tabela `Aluno`.

-- Adição de chave estrangeira na tabela diariobordo
ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_Aluno_id)
    REFERENCES Aluno (id)
    ON DELETE CASCADE;
-- ALTER TABLE diariobordo: Altera a estrutura da tabela `diariobordo`.
-- ADD CONSTRAINT FK_diariobordo_2: Adiciona uma restrição chamada `FK_diariobordo_2`.
-- FOREIGN KEY (fk_Aluno_id): Define que a coluna `fk_Aluno_id` será uma chave estrangeira.
-- REFERENCES Aluno (id): Especifica que a chave estrangeira `fk_Aluno_id` referencia a coluna `id` da tabela `Aluno`.
-- ON DELETE CASCADE: Define que se um registro na tabela `Aluno` for deletado, todos os registros na tabela `diariobordo` que se referem a esse `id` também serão deletados.
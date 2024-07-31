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

-- Alterar a tabela adicionando a restrição UNIQUE na coluna 'ra' com um nome específico para a constraint
ALTER TABLE Aluno ADD CONSTRAINT constraint_name UNIQUE (ra);
/*
ALTER TABLE Aluno: Este comando indica que a tabela Aluno será modificada.
ADD CONSTRAINT constraint_name: Este comando adiciona uma nova restrição à tabela. constraint_name é o nome que você escolhe para a restrição. Dar um nome à restrição é opcional, mas pode ser útil para referenciá-la ou modificá-la posteriormente.
UNIQUE (ra): Este comando especifica que a coluna ra deve conter valores únicos em todos os registros da tabela Aluno. Isso significa que nenhum valor duplicado será permitido na coluna ra.
Se você não quiser especificar um nome para a constraint, você pode simplesmente adicionar a restrição UNIQUE diretamente:

-- Selecionar o banco de dados
USE schooltracker;

-- Alterar a tabela adicionando a restrição UNIQUE na coluna 'ra' sem um nome específico para a constraint
ALTER TABLE Aluno
ADD UNIQUE (ra);

Diferença entre as duas formas:
Com nome de constrain

ALTER TABLE Aluno
ADD CONSTRAINT constraint_name UNIQUE (ra);
- Dá um nome específico (constraint_name) à restrição, o que facilita referenciá-la em futuras operações (por exemplo, se você precisar remover ou alterar a restrição).

Sem nome de constraint:

ALTER TABLE Aluno
ADD UNIQUE (ra);

O nome da restrição é gerado automaticamente pelo sistema. Isso é mais simples, mas pode ser menos conveniente se você precisar modificar ou remover a restrição no futuro.
*/

-- Pesquisa todos os campos (*) da tabela aluno
DESCRIBE aluno;
SELECT * FROM aluno;
-- Deletar registros da tabela aluno quando id = 4
DELETE FROM aluno where id = 4;
-- Mostra toda a estrutura da tabela
DESCRIBE aluno;
-- Seleção do banco de dados
USE schooltracker;
-- Inserindo registros únicos na tabela Aluno com INSERT
INSERT INTO Aluno (ra) VALUES ('00034547');
INSERT INTO Aluno (ra) VALUES ('00034548');
INSERT INTO Aluno (ra) VALUES ('00034549');
INSERT INTO Aluno (ra) VALUES ('00034550');
INSERT INTO Aluno (ra) VALUES ('00034551');
INSERT INTO Aluno (ra) VALUES ('00034552');
INSERT INTO Aluno (ra) VALUES ('00034553');
INSERT INTO Aluno (ra) VALUES ('00034554');
INSERT INTO Aluno (ra) VALUES ('00034555');
INSERT INTO Aluno (ra) VALUES ('00034556');
INSERT INTO Aluno (ra) VALUES ('00034557');
INSERT INTO Aluno (ra) VALUES ('00034558');
INSERT INTO Aluno (ra) VALUES ('00034559');
INSERT INTO Aluno (ra) VALUES ('00034560');
INSERT INTO Aluno (ra) VALUES ('00034561');
INSERT INTO Aluno (ra) VALUES ('00034562');
INSERT INTO Aluno (ra) VALUES ('00034563');
INSERT INTO Aluno (ra) VALUES ('00034564');
INSERT INTO Aluno (ra) VALUES ('00034565');
INSERT INTO Aluno (ra) VALUES ('00034566');
INSERT INTO Aluno (ra) VALUES ('00034567');
INSERT INTO Aluno (ra) VALUES ('00034568');
INSERT INTO Aluno (ra) VALUES ('00034569');
INSERT INTO Aluno (ra) VALUES ('00034570');
INSERT INTO Aluno (ra) VALUES ('00034571');
INSERT INTO Aluno (ra) VALUES ('00034572');
INSERT INTO Aluno (ra) VALUES ('00034573');
INSERT INTO Aluno (ra) VALUES ('00034574');
INSERT INTO Aluno (ra) VALUES ('00034575');
INSERT INTO Aluno (ra) VALUES ('00034576');
INSERT INTO Aluno (ra) VALUES ('00034577');
INSERT INTO Aluno (ra) VALUES ('00034578');
INSERT INTO Aluno (ra) VALUES ('00034579');
INSERT INTO Aluno (ra) VALUES ('00034580');
INSERT INTO Aluno (ra) VALUES ('00034581');
INSERT INTO Aluno (ra) VALUES ('00034582');
INSERT INTO Aluno (ra) VALUES ('00034583');
INSERT INTO Aluno (ra) VALUES ('00034584');
INSERT INTO Aluno (ra) VALUES ('00034585');
INSERT INTO Aluno (ra) VALUES ('00034586');
INSERT INTO Aluno (ra) VALUES ('00034587');
INSERT INTO Aluno (ra) VALUES ('00034588');
INSERT INTO Aluno (ra) VALUES ('00034589');
INSERT INTO Aluno (ra) VALUES ('00034590');
INSERT INTO Aluno (ra) VALUES ('00034591');
INSERT INTO Aluno (ra) VALUES ('00034592');
INSERT INTO Aluno (ra) VALUES ('00034593');
INSERT INTO Aluno (ra) VALUES ('00034594');
INSERT INTO Aluno (ra) VALUES ('00034595');
INSERT INTO Aluno (ra) VALUES ('00034596');

/*
- Método 1: Inserção Múltipla com Vários Comandos INSERT
	INSERT INTO Aluno (ra) VALUES ('00034549');
	INSERT INTO Aluno (ra) VALUES ('00034547');
	-- e assim por diante...

	Vantagens:
	Simplicidade: Cada comando INSERT insere um único registro, o que pode ser mais fácil de entender e depurar.
	Desvantagens:
	Desempenho: Executar múltiplos comandos INSERT individualmente pode ser menos eficiente, especialmente quando há muitos registros a serem inseridos. Cada comando INSERT individual requer uma rodada de comunicação com o servidor de banco de dados, o que pode aumentar o tempo total de execução.
	Manutenção: Gerenciar e manter um grande número de comandos INSERT individuais pode ser mais difícil e propenso a erros

Método 2: Inserção Múltipla em um Único Comando INSERT
	INSERT INTO Aluno (ra) VALUES
	('00034549'),
	('00034547'),
	-- e assim por diante...
	('00034596');

	Vantagens:
	Desempenho: Usar um único comando INSERT para adicionar vários registros de uma vez é geralmente mais eficiente. O servidor de banco de dados processa a inserção como uma operação única, o que pode reduzir o tempo total de execução e a sobrecarga de comunicação.
	Manutenção: É mais fácil gerenciar e manter um único comando INSERT que contém múltiplos valores, especialmente ao lidar com um grande número de registros.

	Desvantagens:
	Limitações de tamanho: Dependendo da configuração do servidor de banco de dados e do tamanho dos dados a serem inseridos, pode haver limitações no número de registros que podem ser inseridos em um único comando INSERT.
	Legibilidade: Comandos INSERT muito longos podem ser mais difíceis de ler e depurar, embora o uso de quebras de linha e formatação adequada possa mitigar isso.
	
    Escolha do Método
	Para pequenas quantidades de dados: Ambos os métodos são adequados, mas o método de inserção múltipla em um único comando INSERT ainda é preferível por razões de desempenho.
	Para grandes quantidades de dados: O método de inserção múltipla em um único comando INSERT é geralmente mais eficiente.
	No entanto, se houver limitações no tamanho dos comandos ou requisitos específicos, dividir os dados em vários comandos INSERT menores pode ser necessário.
*/

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

-- Pesquisa todos os campos (*) da tabela diariobordo
SELECT * from diariobordo;

-- Visualiza as tabelas disponiveis no banco de dados schooltracker
show tables;
-- DESAFIO - Com ou sem GPT faça um insert na tabela diariobordo

-- Selecionar o banco de dados
USE schooltracker;

-- Inserir um novo registro na tabela diariobordo
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id)
VALUES ('30/07/2024 - Banco de Dados', '2024-07-30 16:00:00', 3);

-- Inserir mais registros no diariobordo para outros alunos
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Python', '2024-07-31 09:00:00', 11);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Variáveis e Tipos de Dados', '2024-08-01 10:00:00', 12);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Estruturas de Controle', '2024-08-02 11:00:00', 13);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Funções e Módulos', '2024-08-03 12:00:00', 14);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao NumPy', '2024-08-04 13:00:00', 15);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Manipulação de Dados com Pandas', '2024-08-05 14:00:00', 16);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Visualização de Dados com Matplotlib', '2024-08-06 15:00:00', 17);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Machine Learning', '2024-08-07 16:00:00', 18);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Redes Neurais com TensorFlow', '2024-08-08 17:00:00', 19);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Projeto Final de IA', '2024-08-09 18:00:00', 20);

-- Continue até 50 registros
-- Selecionar o banco de dados
USE schooltracker;

-- Inserir 10 novos registros na tabela diariobordo com descrições relacionadas ao curso de Python e IA
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Python', '2024-07-31 09:00:00', 1);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Variáveis e Tipos de Dados', '2024-08-01 10:00:00', 2);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Estruturas de Controle', '2024-08-02 11:00:00', 3);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Funções e Módulos', '2024-08-03 12:00:00', 4);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao NumPy', '2024-08-04 13:00:00', 5);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Manipulação de Dados com Pandas', '2024-08-05 14:00:00', 6);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Visualização de Dados com Matplotlib', '2024-08-06 15:00:00', 7);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Machine Learning', '2024-08-07 16:00:00', 8);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Redes Neurais com TensorFlow', '2024-08-08 17:00:00', 9);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Projeto Final de IA', '2024-08-09 18:00:00', 10);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Python', '2024-07-31 09:00:00', 21);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Variáveis e Tipos de Dados', '2024-08-01 10:00:00', 22);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Estruturas de Controle', '2024-08-02 11:00:00', 23);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Funções e Módulos', '2024-08-03 12:00:00', 24);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao NumPy', '2024-08-04 13:00:00', 25);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Manipulação de Dados com Pandas', '2024-08-05 14:00:00', 26);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Visualização de Dados com Matplotlib', '2024-08-06 15:00:00', 27);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Machine Learning', '2024-08-07 16:00:00', 28);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Redes Neurais com TensorFlow', '2024-08-08 17:00:00', 29);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Projeto Final de IA', '2024-08-09 18:00:00', 30);

-- Verificando se o registro foi criado
SELECT * from diariobordo;

/* REINCIANDO O ID PARA CONTAR  PARTIR DE 1


Para reiniciar a numeração da coluna id da tabela Aluno, você pode usar o comando TRUNCATE TABLE ou redefinir manualmente o valor de auto incremento. Aqui estão os dois métodos:

Método 1: Usando TRUNCATE TABLE
O comando TRUNCATE TABLE remove todos os registros da tabela e reinicia o contador de auto incremento. No entanto, como sua tabela Aluno está referenciada por outra tabela (diariobordo), você precisará remover temporariamente a restrição de chave estrangeira.

Aqui estão os passos:

Remover a chave estrangeira temporariamente.
Truncar a tabela.
Adicionar novamente a chave estrangeira.

-- Selecionar o banco de dados
USE schooltracker;

-- Remover a restrição de chave estrangeira temporariamente
ALTER TABLE diariobordo DROP FOREIGN KEY FK_diariobordo_2;

-- Truncar a tabela Aluno
TRUNCATE TABLE Aluno;

-- Adicionar novamente a restrição de chave estrangeira
ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_Aluno_id)
    REFERENCES Aluno (id)
    ON DELETE CASCADE;
    
-- Adicionar os registros novamente
INSERT INTO Aluno (ra) VALUES ('00034547');
INSERT INTO Aluno (ra) VALUES ('00034548');
INSERT INTO Aluno (ra) VALUES ('00034549');
INSERT INTO Aluno (ra) VALUES ('00034550');
INSERT INTO Aluno (ra) VALUES ('00034551');
INSERT INTO Aluno (ra) VALUES ('00034552');
INSERT INTO Aluno (ra) VALUES ('00034553');
INSERT INTO Aluno (ra) VALUES ('00034554');
INSERT INTO Aluno (ra) VALUES ('00034555');
INSERT INTO Aluno (ra) VALUES ('00034556');
INSERT INTO Aluno (ra) VALUES ('00034557');
INSERT INTO Aluno (ra) VALUES ('00034558');
INSERT INTO Aluno (ra) VALUES ('00034559');
INSERT INTO Aluno (ra) VALUES ('00034560');
INSERT INTO Aluno (ra) VALUES ('00034561');
INSERT INTO Aluno (ra) VALUES ('00034562');
INSERT INTO Aluno (ra) VALUES ('00034563');
INSERT INTO Aluno (ra) VALUES ('00034564');
INSERT INTO Aluno (ra) VALUES ('00034565');
INSERT INTO Aluno (ra) VALUES ('00034566');
INSERT INTO Aluno (ra) VALUES ('00034567');
INSERT INTO Aluno (ra) VALUES ('00034568');
INSERT INTO Aluno (ra) VALUES ('00034569');
INSERT INTO Aluno (ra) VALUES ('00034570');
INSERT INTO Aluno (ra) VALUES ('00034571');
INSERT INTO Aluno (ra) VALUES ('00034572');
INSERT INTO Aluno (ra) VALUES ('00034573');
INSERT INTO Aluno (ra) VALUES ('00034574');
INSERT INTO Aluno (ra) VALUES ('00034575');
INSERT INTO Aluno (ra) VALUES ('00034576');
INSERT INTO Aluno (ra) VALUES ('00034577');
INSERT INTO Aluno (ra) VALUES ('00034578');
INSERT INTO Aluno (ra) VALUES ('00034579');
INSERT INTO Aluno (ra) VALUES ('00034580');
INSERT INTO Aluno (ra) VALUES ('00034581');
INSERT INTO Aluno (ra) VALUES ('00034582');
INSERT INTO Aluno (ra) VALUES ('00034583');
INSERT INTO Aluno (ra) VALUES ('00034584');
INSERT INTO Aluno (ra) VALUES ('00034585');
INSERT INTO Aluno (ra) VALUES ('00034586');
INSERT INTO Aluno (ra) VALUES ('00034587');
INSERT INTO Aluno (ra) VALUES ('00034588');
INSERT INTO Aluno (ra) VALUES ('00034589');
INSERT INTO Aluno (ra) VALUES ('00034590');
INSERT INTO Aluno (ra) VALUES ('00034591');
INSERT INTO Aluno (ra) VALUES ('00034592');
INSERT INTO Aluno (ra) VALUES ('00034593');
INSERT INTO Aluno (ra) VALUES ('00034594');
INSERT INTO Aluno (ra) VALUES ('00034595');
INSERT INTO Aluno (ra) VALUES ('00034596');
*/

/*
-- TEORIA DOS CONJUNTOS
-- Teoria dos conjuntos da matemática utilizada por meio do uso das chaves primárias e estrangeiras de outras tabelas. Elementos de bancos de dados se relacionando com elementos de outros bancos de dados.
-- Utilizada no SQL, em orientação de objetos e nos dataframes quando os objetos se relacionam.
*/

SELECT
    -- Este comando especifica quais colunas devem ser retornadas na consulta.
    -- d.id: A coluna id da tabela diariobordo.
    -- d.texto: A coluna texto da tabela diariobordo.
    -- d.datahora: A coluna datahora da tabela diariobordo.
    -- a.ra: A coluna ra da tabela Aluno.
    d.id,
    d.texto, -- tabela diario de bordo, coluna texto
    d.datahora,
    a.ra AS registro_academico
FROM
    diariobordo AS d
    -- Este comando especifica a tabela principal da qual os dados serão selecionados.
    -- diariobordo AS d: Define um alias d para a tabela diariobordo. O uso de alias simplifica a referência às tabelas nas consultas, especialmente quando há múltiplas tabelas envolvidas.
JOIN 
    aluno AS a
    -- JOIN: Realiza uma junção entre a tabela diariobordo e a tabela Aluno. Este é um tipo de junção interna (INNER JOIN), que retorna apenas as linhas que têm correspondência em ambas as tabelas.
    -- aluno AS a: Define um alias a para a tabela Aluno.
ON
    d.fk_aluno_id = a.id;
    -- ON d.fk_aluno_id = a.id: Especifica a condição de junção, onde a coluna fk_aluno_id da tabela diariobordo deve ser igual à coluna id da tabela Aluno.

-- Este código SQL seleciona dados das tabelas diariobordo e Aluno, combinando-as com base na relação de chave estrangeira entre elas (fk_aluno_id em diariobordo e id em Aluno). A consulta retorna um conjunto de resultados com as seguintes colunas:
-- id da tabela diariobordo
-- texto da tabela diariobordo
-- datahora da tabela diariobordo
-- ra da tabela Aluno
-- O resultado mostra que a consulta uniu corretamente os registros das duas tabelas com base na chave estrangeira fk_aluno_id e na chave primária id.

/*
Explicação Detalhada
SELECT: Especifica as colunas que devem ser retornadas na consulta.

d.id: Retorna a coluna id da tabela diariobordo.
d.texto: Retorna a coluna texto da tabela diariobordo.
d.datahora: Retorna a coluna datahora da tabela diariobordo.
a.ra AS registro_academico: Retorna a coluna ra da tabela Aluno e a renomeia como registro_academico.
FROM: Especifica a tabela principal da qual os dados serão selecionados.

diariobordo AS d: Define um alias d para a tabela diariobordo.
JOIN: Realiza uma junção entre a tabela diariobordo e a tabela Aluno.

aluno AS a: Define um alias a para a tabela Aluno.
ON d.fk_aluno_id = a.id: Especifica a condição de junção, onde a coluna fk_aluno_id da tabela diariobordo deve ser igual à coluna id da tabela Aluno.
Comentários Finais: Explicam que o código SQL seleciona dados das tabelas diariobordo e Aluno, combinando-as com base na relação de chave estrangeira entre elas (fk_aluno_id em diariobordo e id em Aluno). A consulta retorna as colunas especificadas e mostra como os registros das duas tabelas são unidos corretamente.
*/

-- Exercicio - Agora vocÊ deve inserir o diário de bordo da aula de hoje.
-- Qual o seu RA? Insira o seu RA (00169506) no sistema e posteriormente crie o seu diário de bordo.
-- Por último, faça um select
-- Envie esse script para um novo repositório do github
-- Com o nome de projetofinal_tarde (repositório a ser enviado para o professor Rômulo (instrutor.romulo@gmail.com)
-- Exportar também em PNG no formato pé de galinha, e enviar junto para o professor.
-- Criar o projeto do zero, refazer esse script com o projeto, com comentários mais objetivos e inserir apenas o registro de aluno referente ao meu nome e ao meu RA (Registro aluno) Inseir diariamente o registro de bordo.
-- RA é inteiro e possui 8 digitos

-- Selecionar o banco de dados
USE schooltracker;

-- Inserir um novo registro na tabela diariobordo para o seu RA
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id)
VALUES ('31/07/2024 - Minicurso SQL - Introdução a BD | JOIN', '2024-07-31 17:30:00', (SELECT id FROM Aluno WHERE ra = '00169506'));

-- Selecionar os dados do diário de bordo para o seu RA
SELECT
    d.id,
    d.texto,
    d.datahora,
    a.ra AS registro_academico
FROM
    diariobordo AS d
JOIN 
    aluno AS a
ON
    d.fk_aluno_id = a.id
WHERE
    a.ra = '00169506';



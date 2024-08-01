/* projetologico: */

CREATE TABLE aluno (
    id int(6) PRIMARY KEY,
    ra char(8)
);

CREATE TABLE diariobordo (
    id int(6),
    texto text(100),
    datahora datetime,
    fk_aluno_id int(6),
    PRIMARY KEY (id, texto)
);
 
ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;
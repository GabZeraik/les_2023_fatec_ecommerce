CREATE TABLE alunos (
    alu_id         SERIAL,
    alu_dta_cad    TIMESTAMPTZ,
    alu_nome       VARCHAR(100),
    alu_cpf        VARCHAR(11),
    alu_email      VARCHAR(50),
    alu_dta_nasc   VARCHAR(10),
    alu_registro   VARCHAR(50),
    alu_logradouro VARCHAR(100),
    alu_bairro     VARCHAR(100),
    alu_cep        VARCHAR(8),
    alu_cidade     VARCHAR(100),
    alu_estado     VARCHAR(2),
    curso_id       INTEGER NOT NULL
);

ALTER TABLE alunos ADD CONSTRAINT alu_pk PRIMARY KEY ( alu_id );

ALTER TABLE alunos
    ADD CONSTRAINT alunos_cursos_fk FOREIGN KEY ( curso_id )
        REFERENCES cursos ( cur_id )
            ON DELETE CASCADE;

CREATE TABLE cursos (
    cur_id        SERIAL,
    cur_dta_cad   TIMESTAMPTZ,
    cur_nome      VARCHAR(100),
    cur_descricao VARCHAR(300),
    cur_periodo   VARCHAR(10)
);

ALTER TABLE cursos ADD CONSTRAINT cur_pk PRIMARY KEY ( cur_id );

CREATE TABLE professores (
    pro_id         SERIAL,
    pro_dta_cad    TIMESTAMPTZ,
    pro_nome       VARCHAR(100),
    pro_cpf        VARCHAR(11),
    pro_email      VARCHAR(50),
    pro_registro   VARCHAR(50),
    pro_logradouro VARCHAR(100),
    pro_bairro     VARCHAR(100),
    pro_cep        VARCHAR(8),
    pro_cidade     VARCHAR(100),
    pro_estado     VARCHAR(2),
    curso_1_id       INTEGER NOT NULL,
    curso_2_id       INTEGER
);

ALTER TABLE professores ADD CONSTRAINT pro_pk PRIMARY KEY ( pro_id );

ALTER TABLE professores
    ADD CONSTRAINT professores_cursos_1_fk FOREIGN KEY ( curso_id )
        REFERENCES cursos ( cur_id )
            ON DELETE CASCADE;
            
ALTER TABLE professores
    ADD CONSTRAINT professores_cursos_2_fk FOREIGN KEY ( curso_id )
        REFERENCES cursos ( cur_id )
            ON DELETE NO ACTION;
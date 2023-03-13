CREATE TABLE bandeiras (
    ban_id     SERIAL,
    ban_codigo VARCHAR(15),
    ban_nome   VARCHAR(50)
);

ALTER TABLE bandeiras ADD CONSTRAINT bandeiras_pk PRIMARY KEY ( ban_id );

CREATE TABLE cartoes (
    car_id               SERIAL,
    car_numero           VARCHAR(30),
    car_nome_impresso    VARCHAR(30),
    car_codigo_seguranca VARCHAR(3),
    car_preferencial    CHAR(1),
    bandeiras_ban_id     INTEGER,
    clientes_cli_id      INTEGER NOT NULL
);

ALTER TABLE cartoes ADD CONSTRAINT cartoes_pk PRIMARY KEY ( car_id );

CREATE TABLE categorias (
    cat_id          SERIAL,
    cat_nome        VARCHAR(50),
    produtos_pro_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX categorias__idx ON
    categorias (
        produtos_pro_id
    ASC );

ALTER TABLE categorias ADD CONSTRAINT categorias_pk PRIMARY KEY ( cat_id );

CREATE TABLE clientes (
    cli_id              SERIAL,
    cli_codigo          VARCHAR(40),
    cli_usuario         VARCHAR(50),
    cli_senha           VARCHAR(30),
    cli_situacao        VARCHAR(10),
    cli_nome_completo   VARCHAR(150),
    cli_genero          VARCHAR(25),
    cli_data_nascimento VARCHAR(10),
    cli_cpf             VARCHAR(11),
    cli_email           VARCHAR(50),
    cli_ddd_telefone    VARCHAR(3),
    cli_numero_telefone VARCHAR(10),
    cli_tipo_telefone 	VARCHAR(30),
    cli_ranking         VARCHAR(10),
    cli_justificativa	VARCHAR(350)
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( cli_id );

CREATE TABLE cupons (
    cup_id          SERIAL,
    cup_codigo      VARCHAR(40),
    cup_valor       NUMERIC(7),
    cup_tipo  		VARCHAR(30)
    clientes_cli_id INTEGER
);

ALTER TABLE cupons ADD CONSTRAINT cupons_pk PRIMARY KEY ( cup_id );

CREATE TABLE enderecos (
    end_id          SERIAL,
    end_frase       VARCHAR(250),
    end_cep         VARCHAR(8),
    end_logradouro  VARCHAR(250),
    end_numero      VARCHAR(8),
    end_bairro      VARCHAR(250),
    end_cidade      VARCHAR(250),
    end_estado      VARCHAR(250),
    end_pais        VARCHAR(250),
    end_observacao  VARCHAR(350),
    end_tipo  		VARCHAR(30),
    end_residencia	VARCHAR(30),
    end_tipo_logradouro VARCHAR(30),
    clientes_cli_id INTEGER NOT NULL
);

ALTER TABLE enderecos ADD CONSTRAINT enderecos_pk PRIMARY KEY ( end_id );

CREATE TABLE itens (
    item_id             SERIAL,
    item_quantidade     INTEGER,
    item_preco_unitario NUMERIC(7),
    pedidos_ped_id      INTEGER NOT NULL
);

ALTER TABLE itens ADD CONSTRAINT itens_pk PRIMARY KEY ( item_id );

CREATE TABLE itens_estoque (
    est_id             SERIAL,
    est_codigo_entrada VARCHAR(40),
    est_quantidade     INTEGER,
    est_valor_custo    NUMERIC(7),
    est_fornecedor     VARCHAR(150),
    est_data_entrada   DATE,
    produtos_pro_id    INTEGER NOT NULL
);

ALTER TABLE itens_estoque ADD CONSTRAINT itens_estoque_pk PRIMARY KEY ( est_id );

CREATE TABLE pedidos (
    ped_id                 SERIAL,
    ped_codigo             VARCHAR(40),
    ped_valor_total        NUMERIC(7),
    ped_data_pedido        DATE,
    ped_situacao           VARCHAR(50),
    ped_modificado_por     VARCHAR(150),
    ped_ultima_atualizacao DATE,
    clientes_cli_id        INTEGER
);

ALTER TABLE pedidos ADD CONSTRAINT pedidos_pk PRIMARY KEY ( ped_id );

CREATE TABLE produtos (
    pro_id            SERIAL,
    pro_codigo        VARCHAR(40),
    pro_nome          VARCHAR(150),
    pro_tamanho       VARCHAR(2),
    pro_cor           VARCHAR(50),
    pro_genero        VARCHAR(15),
    pro_grupo_preco   VARCHAR(10),
    pro_preco_atual   NUMERIC(7),
    pro_codigo_barras VARCHAR(50),
    pro_justificativa VARCHAR(250),
    itens_item_id     INTEGER NOT NULL
);

CREATE UNIQUE INDEX produtos__idx ON
    produtos (
        itens_item_id
    ASC );

ALTER TABLE produtos ADD CONSTRAINT produtos_pk PRIMARY KEY ( pro_id );

ALTER TABLE cartoes
    ADD CONSTRAINT cartoes_bandeiras_fk FOREIGN KEY ( bandeiras_ban_id )
        REFERENCES bandeiras ( ban_id );

ALTER TABLE cartoes
    ADD CONSTRAINT cartoes_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE categorias
    ADD CONSTRAINT categorias_produtos_fk FOREIGN KEY ( produtos_pro_id )
        REFERENCES produtos ( pro_id );

ALTER TABLE cupons
    ADD CONSTRAINT cupons_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE enderecos
    ADD CONSTRAINT enderecos_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE itens_estoque
    ADD CONSTRAINT itens_estoque_produtos_fk FOREIGN KEY ( produtos_pro_id )
        REFERENCES produtos ( pro_id );

ALTER TABLE itens
    ADD CONSTRAINT itens_pedidos_fk FOREIGN KEY ( pedidos_ped_id )
        REFERENCES pedidos ( ped_id );

ALTER TABLE pedidos
    ADD CONSTRAINT pedidos_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE produtos
    ADD CONSTRAINT produtos_itens_fk FOREIGN KEY ( itens_item_id )
        REFERENCES itens ( item_id );


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
    car_validade		 VARCHAR(4),
    car_codigo_seguranca VARCHAR(3),
    car_preferencial	 CHAR(1),
    bandeiras_ban_id     INTEGER,
    clientes_cli_id      INTEGER NOT NULL
);

ALTER TABLE cartoes ADD CONSTRAINT cartoes_pk PRIMARY KEY ( car_id );

CREATE TABLE categorias (
    cat_id          SERIAL,
    cat_nome        VARCHAR(50)
);

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
    cup_valor       NUMERIC(10,2),
    cup_tipo  		VARCHAR(30),
    cup_valido      INTEGER NOT NULL,
    clientes_cli_id INTEGER,
    pedidos_ped_id  INTEGER
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

CREATE TABLE itens_pedidos (
    item_id             SERIAL,
    item_quantidade     INTEGER,
    item_preco_unitario NUMERIC(10,2),
    produtos_pro_id     INTEGER NOT NULL,
    pedidos_ped_id      INTEGER NOT NULL
);

ALTER TABLE itens_pedidos ADD CONSTRAINT itens_pedidos_pk PRIMARY KEY ( item_id );

CREATE TABLE itens_estoque (
    est_id             SERIAL,
    est_codigo_entrada VARCHAR(40),
    est_quantidade     INTEGER,
    est_valor_custo    NUMERIC(10,2),
    est_fornecedor     VARCHAR(150),
    est_data_entrada   DATE,
    produtos_pro_id    INTEGER NOT NULL
);

ALTER TABLE itens_estoque ADD CONSTRAINT itens_estoque_pk PRIMARY KEY ( est_id );

CREATE TABLE pedidos (
    ped_id                 SERIAL,
    ped_codigo             VARCHAR(40),
    ped_valor_total        NUMERIC(10,2),
    ped_data_pedido        DATE,
    ped_situacao           VARCHAR(50),
    ped_modificado_por     VARCHAR(150),
    ped_ultima_atualizacao DATE,
    clientes_cli_id        INTEGER NOT NULL
);

ALTER TABLE pedidos ADD CONSTRAINT pedidos_pk PRIMARY KEY ( ped_id );

CREATE TABLE produtos (
    pro_id            SERIAL,
    pro_codigo        VARCHAR(40),
    pro_nome          VARCHAR(150),
    pro_tamanho       VARCHAR(3),
    pro_cor           VARCHAR(50),
    pro_genero        VARCHAR(15),
    pro_grupo_preco   VARCHAR(10),
    pro_preco_atual   NUMERIC(10,2),
    pro_codigo_barras VARCHAR(50),
    pro_estoque_mao   INTEGER,
    pro_justificativa VARCHAR(250)
);

ALTER TABLE produtos ADD CONSTRAINT produtos_pk PRIMARY KEY ( pro_id );

CREATE TABLE produto_categorias (
    produtos_pro_id   INTEGER NOT NULL,
    categorias_cat_id INTEGER NOT NULL
);

ALTER TABLE produto_categorias ADD CONSTRAINT produtos_categorias_pk PRIMARY KEY ( produtos_pro_id, categorias_cat_id);

CREATE TABLE carrinhos (
    shop_id           SERIAL,
    shop_session_id   VARCHAR(50),
    clientes_cli_id   INTEGER
);

ALTER TABLE carrinhos ADD CONSTRAINT carrinhos_pk PRIMARY KEY ( shop_id );

CREATE TABLE itens_carrinhos (
    item_id             SERIAL,
    item_quantidade     INTEGER,
    item_preco_unitario NUMERIC(10,2),
    produtos_pro_id     INTEGER NOT NULL,
    carrinhos_shop_id    INTEGER NOT NULL
);

ALTER TABLE itens_carrinhos ADD CONSTRAINT itens_carrinhos_pk PRIMARY KEY ( item_id );

CREATE TABLE transacoes (
    tra_id             SERIAL,
    tra_valor_pago     NUMERIC(10,2),
    pedidos_ped_id     INTEGER NOT NULL,
    cartoes_car_id     INTEGER NOT NULL
);

ALTER TABLE transacoes ADD CONSTRAINT transacoes_pk PRIMARY KEY ( tra_id );

CREATE TABLE fretes (
    fre_id             SERIAL,
    fre_codigo         INTEGER,
    fre_porcentagem    NUMERIC(4,3)
);

ALTER TABLE fretes ADD CONSTRAINT fretes_pk PRIMARY KEY ( fre_id );

-- ****** ALTERAÇÃO PARA CRIAR TROCAS *******

CREATE TABLE pedidos_trocas (
    tro_id                 SERIAL,
    tro_codigo             VARCHAR(40),
    tro_valor_total        NUMERIC(10,2),
    tro_data_pedido        DATE,
    tro_situacao           VARCHAR(50),
    tro_modificado_por     VARCHAR(150),
    tro_ultima_atualizacao DATE,
    cupons_cup_id          INTEGER,
    clientes_cli_id        INTEGER NOT NULL
);

ALTER TABLE pedidos_trocas ADD CONSTRAINT pedidos_trocas_pk PRIMARY KEY ( tro_id );

CREATE TABLE itens_trocas (
    item_id             SERIAL,
    item_quantidade     INTEGER,
    item_preco_unitario NUMERIC(10,2),
    itens_pedidos_item_id     INTEGER NOT NULL,
    pedidos_trocas_tro_id     INTEGER NOT NULL
);

ALTER TABLE itens_trocas ADD CONSTRAINT itens_trocas_pk PRIMARY KEY ( item_id );

ALTER TABLE pedidos_trocas
    ADD CONSTRAINT pedidos_trocas_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE pedidos_trocas
    ADD CONSTRAINT pedidos_trocas_cupom_fk FOREIGN KEY ( cupons_cup_id )
        REFERENCES cupons ( cup_id );

ALTER TABLE itens_trocas
    ADD CONSTRAINT itens_trocas_pedidos_trocas_fk FOREIGN KEY ( pedidos_trocas_tro_id )
        REFERENCES pedidos_trocas ( tro_id ) ON DELETE CASCADE;

ALTER TABLE itens_trocas
    ADD CONSTRAINT itens_trocas_itens_pedidos_fk FOREIGN KEY ( itens_pedidos_item_id )
        REFERENCES itens_pedidos ( item_id );

-- ****** FIM ALTERAÇÂO ******

ALTER TABLE cartoes
    ADD CONSTRAINT cartoes_bandeiras_fk FOREIGN KEY ( bandeiras_ban_id )
        REFERENCES bandeiras ( ban_id );

ALTER TABLE cartoes
    ADD CONSTRAINT cartoes_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE cupons
    ADD CONSTRAINT cupons_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE cupons
    ADD CONSTRAINT cupons_pedidos_fk FOREIGN KEY ( pedidos_ped_id )
        REFERENCES pedidos ( ped_id ) ON DELETE CASCADE;

ALTER TABLE enderecos
    ADD CONSTRAINT enderecos_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE itens_estoque
    ADD CONSTRAINT itens_estoque_produtos_fk FOREIGN KEY ( produtos_pro_id )
        REFERENCES produtos ( pro_id );

ALTER TABLE itens_pedidos
    ADD CONSTRAINT itens_pedidos_pedidos_fk FOREIGN KEY ( pedidos_ped_id )
        REFERENCES pedidos ( ped_id ) ON DELETE CASCADE;

ALTER TABLE itens_pedidos
    ADD CONSTRAINT itens_pedidos_produtos_fk FOREIGN KEY ( produtos_pro_id )
        REFERENCES produtos ( pro_id );

ALTER TABLE itens_carrinhos
    ADD CONSTRAINT itens_carrinhos_carrinhos_fk FOREIGN KEY ( carrinhos_shop_id )
        REFERENCES carrinhos ( shop_id ) ON DELETE CASCADE;

ALTER TABLE itens_carrinhos
    ADD CONSTRAINT itens_carrinhos_produtos_fk FOREIGN KEY ( produtos_pro_id )
        REFERENCES produtos ( pro_id );

ALTER TABLE pedidos
    ADD CONSTRAINT pedidos_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE carrinhos
    ADD CONSTRAINT carrinhos_clientes_fk FOREIGN KEY ( clientes_cli_id )
        REFERENCES clientes ( cli_id ) ON DELETE CASCADE;

ALTER TABLE transacoes
    ADD CONSTRAINT transacoes_cartoes_fk FOREIGN KEY ( cartoes_car_id )
        REFERENCES cartoes ( car_id );

ALTER TABLE transacoes
    ADD CONSTRAINT transacoes_pedidos_fk FOREIGN KEY ( pedidos_ped_id )
        REFERENCES pedidos ( ped_id ) ON DELETE CASCADE;


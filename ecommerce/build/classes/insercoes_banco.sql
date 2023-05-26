/*Bandeiras*/
INSERT INTO bandeiras (ban_codigo, ban_nome) VALUES (4, 'VISA');
INSERT INTO bandeiras (ban_codigo, ban_nome) VALUES (5, 'MASTERCARD');

/*Produtos*/
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('35356-852', 'Camiseta Xadrez', 'G', 'Azul', 'Feminina', '1', 113.3, '65044-3078', 'amet nulla quisque');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('49288-0637', 'Camisa Social', 'M', 'Branca', 'Masculina', '2', 113.21, '34645-4188', 'at nulla suspendisse');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('42291-757', 'Camiseta Básica', 'P', 'Laranja', 'Unissex', '3', 77.05, '46122-185', 'sapien sapien non mi integer');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('10237-719', 'Regata Florida', 'G', 'Preta', 'Masculina', '4', 79.36, '63629-4698', 'donec ut mauris');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('36000-064', 'Camiseta Básica', 'GG', 'Vermelha', 'Feminina', '5', 114.32, '48951-8246', 'justo in blandit ultrices enim');

/*Categorias*/
INSERT INTO categorias (cat_nome) VALUES ('CATEGORIA 1');
INSERT INTO categorias (cat_nome) VALUES ('CATEGORIA 2');
INSERT INTO categorias (cat_nome) VALUES ('CATEGORIA 3');

/*Produto Categorias*/
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (1, 1);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (1, 3);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (2, 2);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (3, 2);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (4, 3);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (5, 1);

/*CUPONS*/
INSERT INTO cupons (cup_codigo, cup_valor, cup_tipo, clientes_cli_id, cup_valido)	
    VALUES (155, 20.00, 'DESCONTO', 17, 1);
INSERT INTO cupons (cup_codigo, cup_valor, cup_tipo, clientes_cli_id, cup_valido)	
    VALUES (154, 15.00, 'DESCONTO', 17, 1);
INSERT INTO cupons (cup_codigo, cup_valor, cup_tipo, clientes_cli_id, cup_valido)	
    VALUES (157, 10.00, 'PROMOCIONAL', 17, 0);

/*FRETE*/
INSERT INTO fretes (fre_codigo, fre_porcentagem) VALUES (087, 0.10);
INSERT INTO fretes (fre_codigo, fre_porcentagem) VALUES (086, 0.11);
INSERT INTO fretes (fre_codigo, fre_porcentagem) VALUES (084, 0.15);
INSERT INTO fretes (fre_codigo, fre_porcentagem) VALUES (184, 0.20);



/*Bandeiras*/
INSERT INTO bandeiras (ban_codigo, ban_nome) VALUES (4, 'VISA');
INSERT INTO bandeiras (ban_codigo, ban_nome) VALUES (5, 'MASTERCARD');

/*Produtos*/
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('35356-852', 'Dawn Professionl Pot And Pan', 'L', 'Teal', 'Female', '1', 113.3, '65044-3078', 'amet nulla quisque');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('49288-0637', 'Wine - Chateau Bonnet', 'L', 'Orange', 'Non-binary', '2', 113.21, '34645-4188', 'at nulla suspendisse');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('42291-757', 'Longos - Grilled Chicken With', 'L', 'Goldenrod', 'Female', '3', 77.05, '46122-185', 'sapien sapien non mi integer');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('10237-719', 'Vaccum Bag 10x13', 'XS', 'Crimson', 'Male', '4', 79.36, '63629-4698', 'donec ut mauris');
INSERT INTO produtos (pro_codigo, pro_nome, pro_tamanho, pro_cor, pro_genero, pro_grupo_preco, pro_preco_atual, pro_codigo_barras, pro_justificativa) 
    VALUES ('36000-064', 'Bread - White, Sliced', '3XL', 'Red', 'Female', '5', 114.32, '48951-8246', 'justo in blandit ultrices enim');

/*Categorias*/
INSERT INTO categorias (cat_nome) VALUES ('CATEGORIA 1');
INSERT INTO categorias (cat_nome) VALUES ('CATEGORIA 2');
INSERT INTO categorias (cat_nome) VALUES ('CATEGORIA 3');

/*Produto Categorias*/
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (1, 3);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (1, 1);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (2, 3);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (3, 2);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (4, 2);
INSERT INTO produto_categorias (produtos_pro_id, categorias_cat_id) VALUES (5, 1);


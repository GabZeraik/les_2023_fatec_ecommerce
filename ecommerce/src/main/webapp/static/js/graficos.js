var grafico_valor_total, grafico_quantidade;
const elem_grafico_valor = document.getElementById('grafico_valor');
const elem_grafico_quantidade = document.getElementById('grafico_quantidade');

const criaGrafico = (filtro = "PRODUTO") => {
    if (grafico_valor_total) grafico_valor_total.destroy();
    if (grafico_quantidade) grafico_quantidade.destroy();
    if (filtro === "PRODUTO") {
        let array_final_grafico = json_produtos_filtrado.map(produto => ({ id: produto.id, quantidade: 0, valor_total: 0 }));

        json_pedidos_filtrado.map(pedido =>
            pedido.item_pedido.forEach(item => {
                let index = array_final_grafico.findIndex(produto => produto.id == item.produto_id);
                array_final_grafico[index].quantidade += item.quantidade;
                array_final_grafico[index].valor_total += item.preco_unitario * item.quantidade;
            })
        );

        grafico_quantidade = new Chart(elem_grafico_quantidade, {
            type: 'bar',
            data: {
                labels: json_produtos_filtrado.map(element =>
                    element.nome
                ),
                datasets: [{
                    label: 'Quantidade Vendida',
                    data: array_final_grafico.map(produto => produto.quantidade),
                    borderWidth: 1,
                    backgroundColor: 'lightgreen'
                }],
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                title: {
                    display: true,
                    text: 'Quantidade vendida por produto'
                }
            }
        });

        grafico_valor_total = new Chart(elem_grafico_valor, {
            type: 'bar',
            data: {
                labels: json_produtos_filtrado.map(element =>
                    element.nome
                ),
                datasets: [{
                    label: 'Valor total em R$',
                    data: array_final_grafico.map(produto => produto.valor_total),
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                title: {
                    display: true,
                    text: 'Valor total vendido por produto'
                }
            }
        });
    }
    if (filtro === "CATEGORIA") {
        let array = [];
        let itens_produtos = [];
        let array_grafico = json_produtos_filtrado.map(produto => produto.categoria);
        array_grafico.map(categorias => categorias.forEach(categoria =>
            array.push({ id: categoria.id, categoria: categoria.nome, quantidade: 0, valor_total: 0 })
        ));

        let array_filtrado = array.filter((value, index, array) => array.findIndex(valor_no_array => valor_no_array.id == value.id) == index);

        let itens = json_pedidos_filtrado.map(pedido => pedido.item_pedido)[0];
        if (itens) {
            itens.forEach(item => {
                let categorias = json_produtos_filtrado.filter(produto => produto.id == item.produto_id)[0].categoria;
                itens_produtos.push({ item_id: item.id, quantidade: item.quantidade, produto_id: item.produto_id, preco_unitario: item.preco_unitario, categorias });
            })
        }

        array_filtrado.forEach(categoria =>
            itens_produtos.filter(item => item.categorias.findIndex(cat => cat.id == categoria.id)).forEach(item_produto => {
                categoria.quantidade += item_produto.quantidade;
                categoria.valor_total += item_produto.preco_unitario * item_produto.quantidade;
            })
        );

        grafico_valor_total = new Chart(elem_grafico_quantidade, {
            type: 'bar',
            data: {
                labels: array_filtrado.map(element =>
                    element.categoria
                ),
                datasets: [{
                    label: 'Quantidade Vendida',
                    data: array_filtrado.map(element => element.quantidade),
                    borderWidth: 1,
                    backgroundColor: 'lightgreen'
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        stacked: true
                    }
                },
                title: {
                    display: true,
                    text: 'Quantidade vendida por categoria'
                }
            }
        });
        grafico_quantidade = new Chart(elem_grafico_valor, {
            type: 'bar',
            data: {
                labels: array_filtrado.map(element =>
                    element.categoria
                ),
                datasets: [{
                    label: 'Valor total em R$',
                    data: array_filtrado.map(element => element.valor_total),
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                title: {
                    display: true,
                    text: 'Valor total vendido por categoria'
                }
            }
        });
    }

}
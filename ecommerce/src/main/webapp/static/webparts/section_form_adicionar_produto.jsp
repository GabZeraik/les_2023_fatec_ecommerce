<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--ADICIONAR PRODUTO AO CARRINHO-->
                <section>
                    <form id="formAdicionarProdutoCarrinho" action="CadastrarItemCarrinho" method="POST">
                        <fieldset>
                            <input type="hidden" name="operacao" value="SALVAR">
                            <input type="hidden" name="tipo_tabela_item" value="carrinho">
                            <input type="hidden" name="carrinho_id" value="${carrinho.id}">
                            <input type="hidden" name="item_produto_id" value="${resultado.dados[0].id}">
                            <input type="hidden" name="item_carrinho_preco_unitario" value="${resultado.dados[0].preco_atual}">
                            <c:if test="${resultado.dados[0].estoque_mao > 0}">
                                <button class="btn btn-inverse" type="submit" form="formAdicionarProdutoCarrinho" id="btnAdicionarAoCarrinho">Adicionar ao carrinho</button>
                                <label>Quantidade:</label>
                                <input type="number" class="span1" placeholder="1" value="1" min="1" max="${resultado.dados[0].estoque_mao}" name="item_carrinho_quantidade">
                            </c:if>
                        </fieldset>
                </section>
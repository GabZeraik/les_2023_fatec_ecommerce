<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--ADICIONAR PRODUTO AO CARRINHO-->
                <section>
                    <c:choose>
                        <c:when test="${carrinho.id > 0}">
                            <form id="formAdicionarProdutoCarrinho" action="CadastrarItemCarrinho" method="POST">
                                <fieldset>
                                    <input type="hidden" name="operacao" value="SALVAR">
                                    <input type="hidden" name="tipo_tabela_item" value="carrinho">
                                    <input type="hidden" name="carrinho_id" value="${carrinho.id}">
                                    <input type="hidden" name="item_produto_id" value="${resultado.dados[0].id}">
                                    <input type="hidden" name="item_carrinho_preco_unitario" value="${resultado.dados[0].preco_atual}">
                                    <label>Quantidade:</label>
                                    <input type="text" class="span1" placeholder="1" value="1" name="item_carrinho_quantidade">
                                </fieldset>
                                <button class="btn btn-inverse" type="submit" form="formAdicionarProdutoCarrinho">Adicionar ao carrinho</button>
                        </c:when>
                        <c:when test="${carrinho == null || carrinho.id == 0}">
                            <p>Não há carrinho para sessão! Faça o login</p>
                        </c:when>
                    </c:choose>
                </section>
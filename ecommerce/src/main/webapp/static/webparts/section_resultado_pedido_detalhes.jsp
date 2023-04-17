<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--DETALHE PEDIDO-->
                <section>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Imagem</th>
                                <th>Produto</th>
                                <th>Quantidade</th>
                                <th>Preço Unitário</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="total" value="0" scope="page" />
                            <c:forEach items="${carrinho.itens}" var="item" varStatus="loop">
                                <c:set var="total" value="${total + (item.preco_unitario * item.quantidade)}" scope="page" />
                                <tr>
                                    <td>
                                        <a href="ConsultarProduto?operacao=CONSULTAR&pro_id=${item.produto_id}" target="_blank"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                    </td>
                                    <td>${item.nome}</td>
                                    <td><input type="text" value="${item.quantidade}" class="input-mini" readonly></td>
                                    <td>R$${fn:replace(item.preco_unitario, '.', ',')}</td>
                                    <c:set var="valor_unitario_item">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${item.preco_unitario * item.quantidade}" />
                                    </c:set>
                                    <td>R$${fn:replace(valor_unitario_item, '.', ',')}</td>
                                </tr>
                                <c:choose>
                                    <c:when test="${loop.last}">
                                        <c:set var="valor_total_itens">
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${total}" />
                                        </c:set>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td><strong>R$${fn:replace(valor_total_itens, '.', ',')}</strong></td>
                                        </tr>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                </section>
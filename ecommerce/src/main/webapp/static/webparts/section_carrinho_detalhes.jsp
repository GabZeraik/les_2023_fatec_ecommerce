<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--CARRINHO-->
                <section>
                    <c:choose>
                        <c:when test="${not empty carrinho.itens}">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Remover</th>
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
                                                <form method="POST" action="ExcluirItemCarrinho">
                                                    <input type="hidden" name="operacao" value="EXCLUIR">
                                                    <input type="hidden" name="tipo_tabela_item" value="carrinho">
                                                    <input type="hidden" name="item_id" value="${item.id}">
                                                    <input type="hidden" name="item_carrinho_quantidade" value="${item.quantidade}">
                                                    <input type="hidden" name="item_carrinho_preco_unitario" value="${item.preco_unitario}">
                                                    <input type="hidden" name="item_produto_id" value="${item.produto_id}">
                                                    <input type="hidden" name="carrinho_id" value="${item.carrinho_id}">
                                                    <input type="submit" value="X" title="Tirar do carrinho">
                                                </form>
                                            </td>
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
                            <c:choose>
                                <c:when test="${param.cCarrinho}">
                                    <h4>Calcular frete</h4>
                                    <fieldset>
                                        <div class="control-group">
                                            <label class="control-label">CEP:</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite o CEP" id="calcular-frete" class="input-large">
                                                <button class="btn" type="button" style="margin-bottom: 10px;">Calcular frete</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <h4>Adicionar cupom</h4>
                                    <fieldset>
                                        <div class="control-group">
                                            <label class="control-label">Cupom de desconto:</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite o cupom de desconto" id="calcular-frete" class="input-xlarge">
                                                <button class="btn" type="button" style="margin-bottom: 10px;">Atualizar valor</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <hr>
                                </c:when>
                            </c:choose>
                            <p class="cart-total right" style="font-size: 14px;">
                                <strong>Sub-Total: </strong><span id="span_resumo_sub_total">R$${fn:replace(valor_total_itens, '.', ',')}</span><br>
                                <strong>Frete: </strong><span id="span_resumo_frete"></span><br>
                                <strong>Cupom: </strong><span id="span_resumo_cupom"></span><br>
                                <strong>Total: </strong><span id="span_resumo_total_final">R$${fn:replace(valor_total_itens, '.', ',')}</span><br>
                            </p>
                            <c:choose>
                                <c:when test="${param.cCarrinho}">
                                    <hr>
                                    <p class="buttons right">
                                        <button class="btn" type="button"><a href="index.jsp">Continuar comprando</a></button>
                                        <button class="btn btn-inverse right" type="submit" id="checkout"><a href="CheckoutCarrinho?operacao=CHECKOUT&logado=${usuario_logado.id}">Finalizar Compra</a></button>
                                    </p>
                                </c:when>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <h3>Poxa, o seu carrinho está vazio! Continue suas compras.</h3>
                        </c:otherwise>
                    </c:choose>
                </section>
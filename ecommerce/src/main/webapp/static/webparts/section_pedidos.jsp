<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
                <!--PEDIDOS-->
                <section class="pedidos_cliente">
                    <form action="#" method="post">
                        <h4 class="title"><span class="text"><strong>Pedidos</strong> Cliente</span></h4>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Cód. Pedido</th>
                                    <th>Valor Total</th>
                                    <th>Data</th>
                                    <th>Situação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <form action="/action_page.php" method="post">
                                    <c:forEach items="${usuario_logado.pedido}" var="pedido" varStatus="loop">
                                        <tr>
                                            <td>
                                                <a class="accordion-toggle" data-toggle="collapse" data-target="#pedido_${pedido.id}" href="#pedido_${pedido.id}">
                                                    <span class="text"><strong>${pedido.id}</strong></span>
                                                </a>
                                                <div id="pedido_${pedido.id}" class="accordion-body collapse">
                                                    <div class="accordion-inner">
                                                        <div class="row-fluid">
                                                            <h5 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h5>
                                                            <table class="table table-striped table-hover" style="background-color: transparent;">
                                                                <thead>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>Produto</th>
                                                                        <th>Quantidade</th>
                                                                        <th>Preço Unitário</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${pedido.item_pedido}" var="item" varStatus="loop">
                                                                        <tr>
                                                                            <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
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
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${loop.last}">
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td><strong>R$${fn:replace(pedido.valor_total, '.', ',')}</strong></td>
                                                                            </tr>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </tbody>
                                                            </table>
                                                            <c:choose>
                                                                <c:when test='${pedido.situacao == "ENTREGUE"}'>
                                                                    <div class="actions" style="float: left">
                                                                        <p>Para solicitar troca ou devolução, selecione o item e digite a quantidade a ser trocada/devolvida</p>
                                                                        <input tabindex="9" class="btn btn-inverse large" class="btn btn-primary" data-toggle="modal" data-target="#detalhesModalPedido_${pedido.id}" value="Solicitar troca/devolução">
                                                                        <!-- Modal -->
                                                                        <div class="modal fade" id="detalhesModalPedido_${pedido.id}" tabindex="-1" role="dialog" aria-labelledby="detalhesModalPedido_${pedido.id}_Label" aria-hidden="true">
                                                                            <div class="modal-dialog" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                        <h3 class="modal-title" id="exampleModalLabel">Pedido #${pedido.id}</h3>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <table class="table table-striped table-hover" style="background-color: transparent;">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th></th>
                                                                                                    <th></th>
                                                                                                    <th>Produto</th>
                                                                                                    <th>Quantidade</th>
                                                                                                    <th>Preço Unitário</th>
                                                                                                    <th>Total</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <c:forEach items="${pedido.item_pedido}" var="item_troca" varStatus="loop">
                                                                                                    <tr>
                                                                                                        <td><input type="checkbox" name="item_selecionado" onchange="handlerCheckItem(this)"></td>
                                                                                                        <td>
                                                                                                            <a href="ConsultarProduto?operacao=CONSULTAR&pro_id=${item_troca.produto_id}" target="_blank"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                                        </td>
                                                                                                        <td>${item_troca.nome}</td>
                                                                                                        <td><input type="number" value="${item_troca.quantidade}" class="input-mini" max="${item_troca.quantidade}" min="1" onchange="calculaValorTotalTrocaItem(this)"></td>
                                                                                                        <td>R$${fn:replace(item_troca.preco_unitario, '.', ',')}</td>
                                                                                                        <c:set var="valor_unitario_item_troca">
                                                                                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${item_troca.preco_unitario * item_troca.quantidade}" />
                                                                                                        </c:set>
                                                                                                        <td>R$${fn:replace(valor_unitario_item_troca, '.', ',')}</td>
                                                                                                    </tr>
                                                                                                </c:forEach>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                                                        <button type="button" class="btn btn-primary">Solicitar</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:when>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>R$${fn:replace(pedido.valor_total, '.', ',')}</td>
                                            <td>${pedido.data_pedido}</td>
                                            <td>${pedido.situacao}</td>
                                        </tr>
                                    </c:forEach>
                                </form>
                            </tbody>
                        </table>
                    </form>
                </section>
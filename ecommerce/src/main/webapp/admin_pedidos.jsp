<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <c:import url="./static/webparts/head.jsp" var="cHead" charEncoding="UTF-8" />
                <c:out value="${cHead}" escapeXml="false" />

                <body>
                    <div id="top-bar" class="container">
                        <div class="row">
                            <form action="ConsultarPedido" method="GET" id="formConsultarPedido">
                                <div class="span4">
                                    <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                                </div>
                                <div class="span6 col">
                                    <h4 class="title">Filtros</h4>
                                    <ul>
                                        <li>Cód. Pedido<input type="text" id="filtro_codigo_pedido" name="codigo_pedido" class="input-block-level search-query"></li>
                                        <li>Situação<input type="text" id="filtro_situacao_pedido" name="situacao_pedido" class="input-block-level search-query"></li>
                                        <li>Cód. Cliente<input type="text" id="filtro_codigo_cliente" name="codigo_cliente" class="input-block-level search-query"></li>
                                    </ul>
                                    <div class="actions" style="float: right"><input class="btn btn-inverse large" form="formConsultarPedido" type="submit" name="operacao" value="CONSULTAR" id="botao_consultar"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="wrapper" class="container">
                        <section class="main-content">
                            <div class="row">
                                <div class="span12">
                                    <h4 class="title"><span class="text"><strong>ADMINISTRAÇÃO</strong> Pedidos</span></h4>
                                    <div class="js-container-pedidos-cliente js-liberar-edicao">
                                        <form action="AlterarSituacaoPedido" id="formAlterarSituacaoPedido" method="POST">
                                            <input type="hidden" name="pedido_id" id="formAlterarSituacaoPedido_pedido_id">
                                            <input type="hidden" name="situacao_pedido" id="formAlterarSituacaoPedido_pedido_situacao">
                                        </form>
                                        <table class="table table-striped table-hover" id="resultado_tabela_pedidos">
                                            <thead>
                                                <tr>
                                                    <th>Cód. Pedido</th>
                                                    <th>Cód. Cliente</th>
                                                    <th>Data Pedido</th>
                                                    <th>Valor Final</th>
                                                    <th>Última atualização</th>
                                                    <th>Situação</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <form id="formAtualizarTroca" method="POST" action="AlterarSituacaoPedidoTroca">
                                <input type="hidden" name="operacao" value="APROVAR_TROCA">
                                <input type="hidden" name="situacao_troca" id="ipSituacaoTroca">
                                <input type="hidden" name="id_troca" id="ipIdTroca">
                            </form>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>
                    <script src="static/js/crud_cliente.js"></script>
                    <script type="text/javascript">
                        const json_pedidos = JSON.parse('${pedidos}');
                        const container_pedidos_cliente = document.querySelector('.js-container-pedidos-cliente table tbody');
                        const formAlterarSituacaoPedido = document.querySelector('#formAlterarSituacaoPedido');

                        const liberarEdicaoStatusPedido = (button) => {
                            let inputs = button.closest('.js-liberar-edicao').querySelectorAll('input, select, textarea');
                            inputs.forEach(input => {
                                if (input.type == "submit")
                                    input.classList.toggle('hidden')
                                else if (input.tagName == "SELECT")
                                    input.toggleAttribute('disabled');
                                else input.toggleAttribute('readonly');
                            });
                        }

                        const alteraFormSituacaoPedido = (select) => {
                            formAlterarSituacaoPedido.firstElementChild.setAttribute('value', select.id.split('_')[1]);
                            formAlterarSituacaoPedido.lastElementChild.setAttribute('value', select.value);
                        }

                        const preenchePedidos = (dados_pedido) => {
                            container_pedidos_cliente.innerHTML = '';

                            dados_pedido.forEach(ped => {
                                let linha_pedido = new LinhaPedido(ped).criaLinhaPedido();
                                container_pedidos_cliente.insertAdjacentHTML('beforeend', linha_pedido);
                            });

                            document.querySelectorAll('select[name="situacao_pedido"]').forEach((sel, index) => {
                                sel.value = sel.getAttribute('value');
                            });
                        }

                        preenchePedidos(json_pedidos);

                        const submitFormAtualizarTroca = (obj_pedido, aprova_pedido) => {
                            if (aprova_pedido) aprova_pedido = "TROCA AUTORIZADA";
                            else aprova_pedido = "TROCA REJEITADA";

                            document.querySelector('#ipSituacaoTroca').value = aprova_pedido;
                            document.querySelector('#ipIdTroca').value = obj_pedido.id;
                            document.querySelector('#formAtualizarTroca').submit();
                        }
                    </script>
                </body>

                </html>
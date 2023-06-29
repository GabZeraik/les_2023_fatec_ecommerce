<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <c:import url="./static/webparts/head_chart.jsp" var="cHead" charEncoding="UTF-8" />
                <c:out value="${cHead}" escapeXml="false" />

                <body>
                    <div id="top-bar" class="container">
                        <div class="row">
                            <div class="span4">
                                <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div id="wrapper" class="container">
                        <section class="main-content">
                            <div class="row">
                                <div class="span12">
                                    <h4 class="title"><span class="text"><strong>Dados</strong> Vendas</span></h4>
                                </div>
                            </div>
                            <div class="actions"><input class="btn btn-inverse large" id="filtrar_por_produto" onclick="criaGrafico('PRODUTO')" value="POR PRODUTO"></div>
                            <br>
                            <div class="actions"><input class="btn btn-inverse large" id="filtrar_por_categoria" onclick="criaGrafico('CATEGORIA')" value="POR CATEGORIA"></div>
                            <br>
                            <label for="data_inicial_grafico">Data inicial</label>
                            <input type="date" id="data_inicial_grafico" onchange="filtraPedidosData()">
                            <label for="data_final_grafico">Data final</label>
                            <input type="date" id="data_final_grafico" onchange="filtraPedidosData()">
                            <button type="button" onclick="limpaDatas()">LIMPAR DATAS</button>
                        </section>
                        <section>
                            <div class="chartCard">
                                <div class="chartBox">
                                    <canvas id="grafico_quantidade"></canvas>
                                </div>
                                <div class="chartBox">
                                    <canvas id="grafico_valor"></canvas>
                                </div>
                            </div>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>
                    <script type="text/javascript">
                        var json_produtos = JSON.parse('${produtos}');
                        var json_pedidos = JSON.parse('${pedidos}');
                        var json_pedidos_filtrado = json_pedidos;
                        var json_produtos_filtrado = json_produtos;
                        const elem_data_inicial = document.querySelector('#data_inicial_grafico');
                        const elem_data_final = document.querySelector('#data_final_grafico');

                        const limpaDatas = () => {
                            elem_data_inicial.value = "";
                            elem_data_final.value = "";
                        }

                        const filtraPedidosData = () => {
                            let elem_data_inicial = document.querySelector('#data_inicial_grafico').value;
                            let elem_data_final = document.querySelector('#data_final_grafico').value;
                            if (elem_data_final && elem_data_inicial) {
                                json_pedidos_filtrado = json_pedidos.filter(pedido => new Date(elem_data_inicial) <= new Date(pedido.data_pedido) && new Date(elem_data_final) >= new Date(pedido.data_pedido));
                            }
                        }
                    </script>
                    <script src="static/js/graficos.js"></script>
                </body>

                </html>
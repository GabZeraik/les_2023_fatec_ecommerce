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
                        </section>
                        <section>
                            <div>
                                <canvas id="myChart"></canvas>
                            </div>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>
                    <script type="text/javascript">
                        try {
                            const json_pedidos = JSON.parse('${pedidos}');
                            const json_clientes = JSON.parse('${clientes}');
                            const json_produtos = JSON.parse('${produtos}');
                        } catch (error) {

                        }

                        const ctx = document.getElementById('myChart');

                        new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                                datasets: [{
                                    label: '# of Votes',
                                    data: [12, 19, 3, 5, 2, 3],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    </script>
                </body>

                </html>
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
                                    <th>Valor</th>
                                    <th>Data</th>
                                    <th>Situação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <form action="/action_page.php" method="post">
                                    <tr>
                                        <td>
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#item_1">
                                                <span class="text"><strong>122</strong></span>
                                            </a>
                                            <div id="item_1" class="accordion-body collapse">
                                                <div class="accordion-inner">
                                                    <div class="row-fluid">
                                                        <h5 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h5>
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
                                                                <tr>
                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Fusce id molestie massa</td>
                                                                    <td><input type="text" value="1" class="input-mini" readonly></td>
                                                                    <td>R$2.350,00</td>
                                                                    <td>R$2.350,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                    <td><input type="text" value="2" class="input-mini" readonly></td>
                                                                    <td>R$1.150,00</td>
                                                                    <td>R$2.450,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Wuam ultrices rutrum</td>
                                                                    <td><input type="text" value="1" class="input-mini" readonly></td>
                                                                    <td>R$1.210,00</td>
                                                                    <td>R$1.123,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td><strong>R$3.600,00</strong></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <div class="hidden actions" style="float: left">
                                                            <p>Para solicitar troca ou devolução, selecione o item e digite a quantidade a ser trocada/devolvida</p><input tabindex="9" class="btn btn-inverse large" type="submit" value="Solicitar troca/devolução"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>R$350,00</td>
                                        <td>27/02/2023</td>
                                        <td>EM PROCESSAMENTO</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#item_2">
                                                <span class="text"><strong>105</strong></span>
                                            </a>
                                            <div id="item_2" class="accordion-body collapse">
                                                <div class="accordion-inner">
                                                    <div class="row-fluid">
                                                        <h6 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h6>
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
                                                                <tr>
                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Fusce id molestie massa</td>
                                                                    <td><input type="text" value="1" class="input-mini"></td>
                                                                    <td>R$2.350,00</td>
                                                                    <td>R$2.350,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                    <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                    <td>R$1.150,00</td>
                                                                    <td>R$2.450,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Wuam ultrices rutrum</td>
                                                                    <td><input type="text" placeholder="1" value="1" class="input-mini"></td>
                                                                    <td>R$1.210,00</td>
                                                                    <td>R$1.123,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td><strong>R$3.600,00</strong></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <div class="hidden actions" style="float: left">
                                                            <p>Para solicitar troca ou devolução, selecione o item e digite confirme a quantidade a ser trocada/devolvida</p><input tabindex="9" class="btn btn-inverse large" type="submit" value="Solicitar troca/devolução"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>R$350,00</td>
                                        <td>27/02/2023</td>
                                        <td>EM TRÂNSITO</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#item_3">
                                                <span class="text"><strong>98</strong></span>
                                            </a>
                                            <div id="item_3" class="accordion-body collapse">
                                                <div class="accordion-inner">
                                                    <div class="row-fluid">
                                                        <h6 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h6>
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
                                                                <tr>
                                                                    <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Fusce id molestie massa</td>
                                                                    <td><input type="text" value="1" class="input-mini"></td>
                                                                    <td>R$2.350,00</td>
                                                                    <td>R$2.350,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                    <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                    <td>R$1.150,00</td>
                                                                    <td>R$2.450,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Wuam ultrices rutrum</td>
                                                                    <td><input type="text" placeholder="1" value="1" class="input-mini"></td>
                                                                    <td>R$1.210,00</td>
                                                                    <td>R$1.123,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td><strong>R$3.600,00</strong></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <div class="actions" style="float: left">
                                                            <p>Para solicitar troca ou devolução, selecione o item e digite confirme a quantidade a ser trocada/devolvida</p><input tabindex="9" class="btn btn-inverse large" type="submit" value="Solicitar troca/devolução"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>R$350,00</td>
                                        <td>27/02/2022</td>
                                        <td>ENTREGUE</td>
                                    </tr>
                                </form>
                            </tbody>
                        </table>
                    </form>
                </section>
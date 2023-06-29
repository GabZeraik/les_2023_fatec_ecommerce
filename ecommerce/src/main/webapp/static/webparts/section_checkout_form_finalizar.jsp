<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--FORM FINALIZAR CHECKOUT-->
                <section>
                    <div class="row">
                        <div class="span12" style="margin-top: 25px; display: flex; flex-direction: row; justify-content: space-evenly;">
                            <form id="formFinalizarCompra" action="FinalizarCompra" method="POST">
                                <button class="btn" type="button"><a href="index.jsp">Continuar comprando</a></button>
                                <input type="hidden" name="operacao" value="FINALIZAR">
                                <input type="hidden" name="pedido_valor_total" value="" id="valor_total_pedido_final">
                                <div id="cupom_selecionado">

                                </div>
                                <button class="btn btn-inverse right" type="button" form="formFinalizarCompra" id="btnFinalizarCompra" onclick="submitFormulario(this)">Finalizar Compra</button>
                            </form>
                        </div>
                    </div>
                </section>
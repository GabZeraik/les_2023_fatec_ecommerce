<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--CUPONS-->
                <section class="cupons_cliente">
                    <h4 class="title"><span class="text"><strong>Cupons</strong> Cadastrados</span></h4>
                    <c:choose>
                        <c:when test="${not empty usuario_logado.cupom}">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Cód. Cupom</th>
                                        <th>Valor</th>
                                        <th>Tipo</th>
                                        <th>Válido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${usuario_logado.cupom}" var="cupom" varStatus="loop">
                                        <tr>
                                            <td>${cupom.codigo}</td>
                                            <td>R$${fn:replace(cupom.valor, '.', ',')}</td>
                                            <td>${cupom.tipo}</td>
                                            <td>${cupom.valido == 0 ? "Já utilizado" : "Válido"}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p> Você não possui cupons cadastrados
                        </c:otherwise>
                    </c:choose>

                </section>
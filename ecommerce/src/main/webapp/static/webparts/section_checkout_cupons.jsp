<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--CARRINHO CUPONS-->
                <section class="cupons_disponiveis">
                    <h4 class="title"><span class="text"><strong>Utilizar</strong> cupom</span></h4>
                    <fieldset>
                        <c:choose>
                            <c:when test="${not empty usuario_logado.cupom}">
                                <c:forEach items="${usuario_logado.cupom}" var="item" varStatus="loop">
                                    <c:choose>
                                        <c:when test="${item.valido > 0}">
                                            <div class="control-group">
                                                <label class="checkbox" for="cupom_${item.id}">
                                                <input type="checkbox" value="${item.valor}" name="cupom_utilizado" id="cupom_${item.id}" onclick="checkboxCuponsHandler(this)">R$${fn:replace(item.valor, '.', ',')}
                                            </label>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="control-group">
                                                <label class="checkbox" for="${item.id}" disabled>
                                                Já utilizado: R$${fn:replace(item.valor, '.', ',')}
                                            </label>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <span>Você não possui cupons.</span>
                            </c:otherwise>
                        </c:choose>
                    </fieldset>
                </section>
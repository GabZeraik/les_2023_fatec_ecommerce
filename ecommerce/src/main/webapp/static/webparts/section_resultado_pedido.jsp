<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--RESULTADO PEDIDO-->
                <section>
                    <c:choose>
                        <c:when test="${resultado.sucesso == true && resultado != null}">
                            <div class="mensagem-header justify-content-center">
                                <div class="caixa_icone">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                                                </svg>
                                </div>
                                <div class="mensagem-body text-center">
                                    <p id="mensagem_resultado">Seu pedido foi realizado com sucesso. Para acompanha-lo acesse o link abaixo: </p>
                                    <ul>
                                        <li><strong>Número do pedido: </strong> ${pedido_realizado.id} </li>
                                        <li><strong>Código do pedido: </strong> ${pedido_realizado.codigo} </li>
                                        <li><strong>Valor Total: </strong> ${pedido_realizado.valor_total} </li>
                                    </ul>
                                    <button class="btn btn-warning"><span><a href="./account.jsp">Minha Conta</span></a></button>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${resultado.sucesso == false && resultado != null}">
                            <div class="mensagem-header justify-content-center">
                                <div class="caixa_icone" style="color: #f15e5e;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                                </svg>
                                </div>
                                <div class="mensagem-body text-center">
                                    <span>Infelizmente não foi possível realizar esta ação.</span><br>
                                    <span id="mensagem_resultado">${resultado.mensagem}</span>
                                    <button class="btn btn-warning"><span><a href="javascript:history.back()">Voltar</span></a></button>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </section>
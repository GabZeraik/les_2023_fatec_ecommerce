<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <c:import url="./static/webparts/head.jsp" var="cHead" charEncoding="UTF-8" />
                <c:out value="${cHead}" escapeXml="false" />

                <style>
                    .mensagem {
                        color: #434e65;
                        width: 50%;
                        margin: auto;
                    }
                    
                    .mensagem-content {
                        padding: 20px;
                        font-size: 16px;
                        border-radius: 5px;
                        border: none;
                        margin-top: 10px;
                    }
                    
                    .mensagem-header {
                        border-bottom: none;
                        position: relative;
                        text-align: center;
                        margin: -20px -20px 0;
                        border-radius: 5px 5px 0 0;
                        padding: 35px;
                    }
                    
                    .mensagem-body {
                        padding: 15px;
                    }
                    
                    .mensagem h4 {
                        text-align: center;
                        font-size: 36px;
                        margin: 0 0 25px 0;
                    }
                    
                    .caixa_icone {
                        display: flex;
                        color: #47c9a2;
                        justify-content: center;
                    }
                    
                    .caixa_icone svg {
                        display: block;
                    }
                    
                    .btn a {
                        color: white;
                    }
                </style>

                <body>
                    <c:import url="./static/webparts/header_filtros.jsp" var="cHeader" charEncoding="UTF-8" />
                    <c:out value="${cHeader}" escapeXml="false" />

                    <div id="wrapper" class="container">
                        <c:import url="./static/webparts/header_menu.jsp" var="cHeaderMenu" charEncoding="UTF-8" />
                        <c:out value="${cHeaderMenu}" escapeXml="false" />

                        <c:import url="./static/webparts/header_banner.jsp" var="cHeaderBanner" charEncoding="UTF-8" />
                        <c:out value="${cHeaderBanner}" escapeXml="false" />

                        <div class="col-12 container">
                            <div class="mensagem">
                                <div class="mensagem-content">
                                    <c:choose>
                                        <c:when test="${pedido_realizado.id != 0}">

                                            <c:import url="./static/webparts/section_resultado_pedido.jsp" var="cResultadoPedido" charEncoding="UTF-8" />
                                            <c:out value="${cResultadoPedido}" escapeXml="false" />

                                        </c:when>
                                        <c:otherwise>
                                            <c:when test="${resultado.sucesso == true && resultado != null}">
                                                <div class="mensagem-header justify-content-center">
                                                    <div class="caixa_icone">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                                                </svg>
                                                    </div>
                                                    <div class="mensagem-body text-center">
                                                        <p id="mensagem_resultado">${resultado.mensagem}</p>
                                                        <c:choose>
                                                            <c:when test="${resultado.operacao == 'CADASTRO'}">
                                                                <button class="btn btn-warning"><span><a href="./index.jsp">Ir as compras</span></a></button>
                                                            </c:when>
                                                        </c:choose>
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
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </body>

                </html>
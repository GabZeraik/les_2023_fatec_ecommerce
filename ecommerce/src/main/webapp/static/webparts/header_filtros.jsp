<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
            <!--HEADER FILTROS-->
            <section id="header-bar">
                <div id="top-bar" class="container">
                    <div class="row">
                        <div class="span4">
                            <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                            <form method="POST" class="search_form">
                                <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                            </form>
                        </div>
                        <div class="span8">
                            <div class="account pull-right">
                                <ul class="user-menu">
                                    <li><a href="cart.jsp">Carrinho</a></li>
                                    <li><a href="checkout.jsp">Finalizar Compra</a></li>
                                    <c:choose>
                                        <c:when test="${empty usuario_logado}">
                                            <li><a href="login.jsp">Entrar</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="span3">
                                                <span style="font-weight: bold;">Bem vindo ${usuario_logado.nome}</span>
                                            </div>
                                            <li><a href="account.jsp">Minha conta</a></li>
                                            <li>
                                                <form method="GET" action="SairCliente">
                                                    <input type="submit" name="operacao" value="SAIR">
                                                </form>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#filtros">
                                <h4 class="title">Filtros</h4>
                            </a>
                            <div class="span5 col accordion-body collapse" id="filtros">
                                <div class="accordion-inner">
                                    <div class="row-fluid">
                                        <ul style="list-style-type:circle">
                                            <li><input type="checkbox">Status</li>
                                            <li><input type="checkbox">Cód. Único</li>
                                            <li><input type="checkbox">Categorias</li>
                                            <li><input type="checkbox">Nome</li>
                                            <li><input type="checkbox">Tamanho</li>
                                            <li><input type="checkbox">Cor</li>
                                            <li><input type="checkbox">Gênero</li>
                                            <li><input type="checkbox">Grupo Preço</li>
                                            <li><input type="checkbox">Preço atual</li>
                                            <li><input type="checkbox">Valor Custo</li>
                                            <li><input type="checkbox">Cód. Barras</li>
                                            <li><input type="checkbox">Estoque</li>
                                            <li><input type="checkbox">Cat. Status/Justificativa</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
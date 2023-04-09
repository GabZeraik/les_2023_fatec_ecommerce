<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!--HEADER PART-->
    <section id="header-bar">
        <div id="top-bar" class="container">
            <div class="row">
                <div class="span4">
                    <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                    <form method="POST" class="search_form">
                        <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                    </form>
                </div>
                <c:if test="${usuario_logado != null && usuario_logado.nome != ''}">
                    <div class="span3">
                        <span>Bem vindo ${usuario_logado.nome}</span>
                    </div>
                </c:if>
                <div class="span8">
                    <div class="account pull-right">
                        <ul class="user-menu">
                            <li><a href="account.jsp">Minha conta</a></li>
                            <li><a href="cart.jsp">Carrinho</a></li>
                            <li><a href="checkout.jsp">Finalizar Compra</a></li>
                            <li><a href="login.jsp">Entrar</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
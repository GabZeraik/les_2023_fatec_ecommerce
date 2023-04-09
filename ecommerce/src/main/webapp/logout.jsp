<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


            <head>
                <meta charset="utf-8">
                <title>Projeto LES 2023 - E-Commerce</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="">

                <!-- bootstrap -->
                <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
                <link href="static/themes/css/bootstrappage.css" rel="stylesheet" />

                <!-- global styles -->
                <link href="static/themes/css/flexslider.css" rel="stylesheet" />
                <link href="static/themes/css/main.css" rel="stylesheet" />

                <!-- scripts -->
                <script src="static/themes/js/jquery-1.7.2.min.js"></script>
                <script src="static/bootstrap/js/bootstrap.min.js"></script>
                <script src="static/themes/js/superfish.js"></script>
                <script src="static/themes/js/jquery.scrolltotop.js"></script>

            </head>

            <body>
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
                                    <c:if test="${usuario_logado != null}">
                                        <div class="span3">
                                            <span>Bem vindo ${usuario_logado.nome}</span>
                                        </div>
                                        <li><a href="#">Minha conta</a></li>
                                    </c:if>
                                    <li><a href="cart.jsp">Carrinho</a></li>
                                    <li><a href="checkout.jsp">Finalizar Compra</a></li>
                                    <li><a href="login.jsp">Entrar</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="wrapper" class="container">
                    <section class="navbar main-menu">
                        <div class="navbar-inner main-menu">
                            <nav id="menu" class="pull-right">
                                <ul>
                                    <li><a href="./products.jsp">Mulher</a>
                                        <ul>
                                            <li><a href="./products.jsp">Presentes</a></li>
                                            <li><a href="./products.jsp">Acessórios</a></li>
                                            <li><a href="./products.jsp">Inverno</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./products.jsp">Homem</a>
                                        <ul>
                                            <li><a href="./products.jsp">Presentes</a></li>
                                            <li><a href="./products.jsp">Acessórios</a></li>
                                            <li><a href="./products.jsp">Inverno</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./products.jsp">Melhor avaliados</a></li>
                                    <li><a href="./products.jsp">Mais vendidos</a></li>
                                </ul>
                            </nav>
                        </div>
                    </section>
                    <section class="header_text sub">
                        <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="Acessar conta ou entrar">
                    </section>
                    <section class="main-content">
                        <div class="row">
                            <div class="span5">
                                <h4 class="title"><span class="text"><strong>Acessar</strong> Conta</span></h4>
                                <form action="EntrarCliente" method="POST" id="formEntrar">
                                    <input type="hidden" name="operacao" value="CONSULTAR">
                                    <fieldset>
                                        <div class="control-group">
                                            <label class="control-label">Email:</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite seu email" name="email_cliente" id="email_cliente" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Senha:</label>
                                            <div class="controls">
                                                <input type="password" placeholder="Digite sua senha" name="senha_cliente" id="senha_cliente" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="actions"><input class="btn btn-inverse large" form="formEntrar" type="submit" name="entrar_cliente" value="Entrar"></div>
                                            <hr>
                                            <p class="reset">Área <a tabindex="4" href="./admin.jsp" title="Área administrador">administrador</a></p>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="span7">
                                <h4 class="title"><span class="text"><strong>Novo</strong> Cadastro</span></h4>
                                <form action="register.jsp" method="post" class="form-stacked">
                                    <fieldset>
                                        <div class="control-group">
                                            <label class="control-label">Usuário</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite um nome de usuário" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Email:</label>
                                            <div class="controls">
                                                <input type="password" placeholder="Digite seu email" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Senha:</label>
                                            <div class="controls">
                                                <input type="password" placeholder="Digite uma senha" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Confirmação de Senha:</label>
                                            <div class="controls">
                                                <input type="password" placeholder="Digite novamente a senha" class="input-xlarge">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Criar conta">
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section id="footer-bar">
                        <div class="row">
                            <div class="span3">
                                <h4>Navegação</h4>
                                <ul class="nav">
                                    <li><a href="./index.jsp">HOME</a></li>
                                    <li><a href="./about.jsp">Sobre</a></li>
                                    <li><a href="./contact.jsp">Contato</a></li>
                                    <li><a href="./cart.jsp">Carrinho</a></li>
                                    <li><a href="./login.jsp">Entrar</a></li>
                                </ul>
                            </div>
                            <div class="span4">
                                <h4>Minha conta</h4>
                                <ul class="nav">
                                    <li><a href="#">Minha conta</a></li>
                                    <li><a href="#">Histórico de pedidos</a></li>
                                    <li><a href="#">Lista de desejos</a></li>
                                    <li><a href="#">Newsletter</a></li>
                                </ul>
                            </div>
                            <div class="span5">
                                <p class="logo"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></p>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
                                <br/>
                                <span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
                            </div>
                        </div>
                    </section>
                    <section id="copyright">
                        <span>Copyright 2013 bootstrappage template  All right reserved.</span>
                    </section>
                </div>
                <script src="themes/js/common.js"></script>
                <script>
                    $(document).ready(function() {
                        $('#checkout').click(function(e) {
                            document.location.href = "checkout.jsp";
                        })
                    });
                </script>
            </body>

            </html>
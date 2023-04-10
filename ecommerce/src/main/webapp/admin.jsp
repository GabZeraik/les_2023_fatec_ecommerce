<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>


                <head>
                    <meta charset="utf-8">
                    <title>Projeto LES 2023 - E-Commerce</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="description" content="">
                    <!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
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
                    <!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
                </head>

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
                                    <h4 class="title"><span class="text"><strong>ADMINISTRAÇÃO</strong></h4>
                    <button><a href="./admin_produtos.jsp">PRODUTOS</a></button>
                    <button><a href="./admin_clientes.jsp">CLIENTES</a></button>
                    <button><a href="./admin_pedidos.jsp">PEDIDOS</a></button>
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
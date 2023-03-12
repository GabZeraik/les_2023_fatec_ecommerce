<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


            <head>
                <meta charset="utf-8">
                <title>Bootstrap E-commerce Templates</title>
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
			<script src="themes/js/respond.min.js"></script>
		<![endif]-->
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
                                    <li><a href="#">Minha conta</a></li>
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
                        <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="New products">
                    </section>
                    <section class="main-content">
                        <div class="row">
                            <div class="span9">
                                <ul class="thumbnails listing-products">
                                    <li class="span3">
                                        <div class="product-box">
                                            <span class="sale_tag"></span>
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Fusce id molestie massa</a><br/>
                                            <a href="#" class="category">Phasellus consequat</a>
                                            <p class="price">R$341</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Praesent tempor sem</a><br/>
                                            <a href="#" class="category">Erat gravida</a>
                                            <p class="price">R$28</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <span class="sale_tag"></span>
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Wuam ultrices rutrum</a><br/>
                                            <a href="#" class="category">Suspendisse aliquet</a>
                                            <p class="price">R$341</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <span class="sale_tag"></span>
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Praesent tempor sem sodales</a><br/>
                                            <a href="#" class="category">Nam imperdiet</a>
                                            <p class="price">R$49</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Fusce id molestie massa</a><br/>
                                            <a href="#" class="category">Congue diam congue</a>
                                            <p class="price">R$35</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Tempor sem sodales</a><br/>
                                            <a href="#" class="category">Gravida placerat</a>
                                            <p class="price">R$61</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Quam ultrices rutrum</a><br/>
                                            <a href="#" class="category">Orci et nisl iaculis</a>
                                            <p class="price">R$233</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Tempor sem sodales</a><br/>
                                            <a href="#" class="category">Urna nec lectus mollis</a>
                                            <p class="price">R$134</p>
                                        </div>
                                    </li>
                                    <li class="span3">
                                        <div class="product-box">
                                            <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                            <a href="product_detail.jsp" class="title">Luctus quam ultrices</a><br/>
                                            <a href="#" class="category">Suspendisse aliquet</a>
                                            <p class="price">R$261</p>
                                        </div>
                                    </li>
                                </ul>
                                <hr>
                                <div class="pagination pagination-small pagination-centered">
                                    <ul>
                                        <li><a href="#">Anterior</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">Próximo</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="span3 col">
                                <div class="block">
                                    <ul class="nav nav-list">
                                        <li class="nav-header">CATEGORIAS</li>
                                        <li><a href="products.jsp">Nullam semper elementum</a></li>
                                        <li class="active"><a href="products.jsp">Phasellus ultricies</a></li>
                                        <li><a href="products.jsp">Donec laoreet dui</a></li>
                                        <li><a href="products.jsp">Nullam semper elementum</a></li>
                                        <li><a href="products.jsp">Phasellus ultricies</a></li>
                                        <li><a href="products.jsp">Donec laoreet dui</a></li>
                                    </ul>
                                    <br/>
                                    <ul class="nav nav-list below">
                                        <li class="nav-header">MARCAS</li>
                                        <li><a href="products.jsp">Adidas</a></li>
                                        <li><a href="products.jsp">Nike</a></li>
                                        <li><a href="products.jsp">Dunlop</a></li>
                                        <li><a href="products.jsp">Yamaha</a></li>
                                    </ul>
                                </div>
                                <div class="block">
                                    <h4 class="title"><strong>Mais</strong> Vendidos</h4>
                                    <ul class="small-product">
                                        <li>
                                            <a href="#" title="Praesent tempor sem sodales">
                                                <img src="static/themes/images/ladies/3.jpg" alt="Praesent tempor sem sodales">
                                            </a>
                                            <a href="#">Praesent tempor sem</a>
                                        </li>
                                        <li>
                                            <a href="#" title="Luctus quam ultrices rutrum">
                                                <img src="static/themes/images/ladies/4.jpg" alt="Luctus quam ultrices rutrum">
                                            </a>
                                            <a href="#">Luctus quam ultrices rutrum</a>
                                        </li>
                                        <li>
                                            <a href="#" title="Fusce id molestie massa">
                                                <img src="static/themes/images/ladies/5.jpg" alt="Fusce id molestie massa">
                                            </a>
                                            <a href="#">Fusce id molestie massa</a>
                                        </li>
                                    </ul>
                                </div>
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
            </body>

            </html>
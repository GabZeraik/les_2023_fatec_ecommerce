<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <html lang="en">

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
                        <a href="index.html" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                        <form method="POST" class="search_form">
                            <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                        </form>
                    </div>
                    <div class="span8">
                        <div class="account pull-right">
                            <ul class="user-menu">
                                <li><a href="account.html">Minha conta</a></li>
                                <li><a href="cart.html">Carrinho</a></li>
                                <li><a href="checkout.html">Finalizar Compra</a></li>
                                <li><a href="login.html">Entrar</a></li>
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
            <div id="wrapper" class="container">
                <section class="navbar main-menu">
                    <div class="navbar-inner main-menu">
                        <nav id="menu" class="pull-right">
                            <ul>
                                <li><a href="./products.html">Mulher</a>
                                    <ul>
                                        <li><a href="./products.html">Presentes</a></li>
                                        <li><a href="./products.html">Acessórios</a></li>
                                        <li><a href="./products.html">Inverno</a></li>
                                    </ul>
                                </li>
                                <li><a href="./products.html">Homem</a>
                                    <ul>
                                        <li><a href="./products.html">Presentes</a></li>
                                        <li><a href="./products.html">Acessórios</a></li>
                                        <li><a href="./products.html">Inverno</a></li>
                                    </ul>
                                </li>
                                <li><a href="./products.html">Melhor avaliados</a></li>
                                <li><a href="./products.html">Mais vendidos</a></li>
                            </ul>
                        </nav>
                    </div>
                </section>
                <section class="homepage-slider" id="home-slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <img src="static/themes/images/carousel/banner-1.png" alt="" />
                            </li>
                            <li>
                                <img src="static/themes/images/carousel/banner-2.jpg" alt="" />
                                <div class="intro">
                                    <h1>Promoção</h1>
                                    <p><span>Até 50% Off</span></p>
                                    <p><span>Em itens selecionados</span></p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="header_text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut ornare libero. Vivamus euismod nulla eget lacus fringilla, suscipit convallis orci tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu nulla a nibh luctus
                    ultricies vitae eget nisi. Sed in pulvinar ex. Pellentesque mauris ex, vestibulum ut enim eget, rhoncus vehicula augue. Donec vitae tempor felis, in facilisis orci. Cras urna magna, interdum sit amet feugiat id, consectetur eu nisl.
                    In vehicula semper urna, eget lacinia purus vehicula feugiat. Ut gravida pretium lorem ut malesuada.
                </section>
                <section class="main-content">
                    <div class="row">
                        <div class="span12">
                            <div class="row">
                                <div class="span12">
                                    <h4 class="title">
                                        <span class="pull-left"><span class="text"><span class="line"><strong>Produtos</strong></span></span>
                                        </span>
                                        <span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
                                    </h4>
                                    <div id="myCarousel" class="myCarousel carousel slide">
                                        <div class="carousel-inner">
                                            <div class="active item">
                                                <ul class="thumbnails">
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <span class="sale_tag"></span>
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$17,20</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <span class="sale_tag"></span>
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$32.50</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$14.20</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$31.45</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="item">
                                                <ul class="thumbnails">
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$22.30</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$40.25</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$10.45</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">R$35.50</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="span12">
                                    <h4 class="title">
                                        <span class="pull-left"><span class="text"><span class="line">Últimos <strong>Produtos</strong></span></span>
                                        </span>
                                        <span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
                                    </h4>
                                    <div id="myCarousel-2" class="myCarousel carousel slide">
                                        <div class="carousel-inner">
                                            <div class="active item">
                                                <ul class="thumbnails">
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <span class="sale_tag"></span>
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$25.50</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$17.55</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$25.30</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$25.60</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="item">
                                                <ul class="thumbnails">
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Know exactly</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$45.50</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$33.50</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$45.30</p>
                                                        </div>
                                                    </li>
                                                    <li class="span3">
                                                        <div class="product-box">
                                                            <p>
                                                                <a href="product_detail.html"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                            </p>
                                                            <a href="product_detail.html" class="title">Lorem ipsum dolor exerci</a><br/>
                                                            <a href="products.html" class="category">Lorem ipsum dolor</a>
                                                            <p class="price">$25.20</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row feature_box">
                                <div class="span4">
                                    <div class="service">
                                        <div class="responsive">
                                            <img src="static/themes/images/feature_img_2.png" alt="" />
                                            <h4><strong>DEVOLUÇÕES</strong></h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="service">
                                        <div class="customize">
                                            <img src="static/themes/images/feature_img_1.png" alt="" />
                                            <h4><strong>ENTREGA</strong></h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="service">
                                        <div class="support">
                                            <img src="static/themes/images/feature_img_3.png" alt="" />
                                            <h4><strong>ATENDIMENTO</strong></h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="footer-bar">
                    <div class="row">
                        <div class="span3">
                            <h4>Navegação</h4>
                            <ul class="nav">
                                <li><a href="./index.html">HOME</a></li>
                                <li><a href="./about.html">Sobre</a></li>
                                <li><a href="./contact.html">Contato</a></li>
                                <li><a href="./cart.html">Carrinho</a></li>
                                <li><a href="./login.html">Entrar</a></li>
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
            <script src="themes/js/jquery.flexslider-min.js"></script>
            <script type="text/javascript">
                $(function() {
                    $(document).ready(function() {
                        $('.flexslider').flexslider({
                            animation: "fade",
                            slideshowSpeed: 4000,
                            animationSpeed: 600,
                            controlNav: false,
                            directionNav: true,
                            controlsContainer: ".flex-container" // the container that holds the flexslider
                        });
                    });
                });
            </script>
        </body>

        </html>
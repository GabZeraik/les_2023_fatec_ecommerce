<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <html lang="en">

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
                        <a href="index.html" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                        <form method="POST" class="search_form">
                            <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                        </form>
                    </div>
                    <div class="span8">
                        <div class="account pull-right">
                            <ul class="user-menu">
                                <li><a href="#">Minha conta</a></li>
                                <li><a href="cart.html">Carrinho</a></li>
                                <li><a href="checkout.html">Finalizar Compra</a></li>
                                <li><a href="login.html">Entrar</a></li>
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
                <section class="header_text sub">
                    <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="New products">
                </section>
                <section class="main-content">
                    <div class="row">
                        <div class="span9">
                            <h4 class="title"><span class="text"><strong>Meu</strong> Carrinho</span></h4>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Remover</th>
                                        <th>Imagem</th>
                                        <th>Produto</th>
                                        <th>Quantidade</th>
                                        <th>Preço Unitário</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" value="option1"></td>
                                        <td>
                                            <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                        </td>
                                        <td>Fusce id molestie massa</td>
                                        <td><input type="text" value="1" class="input-mini"></td>
                                        <td>R$2.350,00</td>
                                        <td>R$2.350,00</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" value="option1"></td>
                                        <td>
                                            <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                        </td>
                                        <td>Luctus quam ultrices rutrum</td>
                                        <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                        <td>R$1.150,00</td>
                                        <td>R$2.450,00</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" value="option1"></td>
                                        <td>
                                            <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                        </td>
                                        <td>Wuam ultrices rutrum</td>
                                        <td><input type="text" placeholder="1" value="1" class="input-mini"></td>
                                        <td>R$1.210,00</td>
                                        <td>R$1.123,00</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td><strong>R$3.600,00</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                            <h4>Simular frete</h4>
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label">CEP:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="Digite o CEP" id="calcular-frete" class="input-xlarge">
                                        <button class="btn" type="button" style="margin-bottom: 10px;">Calcular frete</button>
                                    </div>
                                </div>
                            </fieldset>
                            <h4>Adicionar cupom</h4>
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label">Cupom de desconto:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="Digite o cupom de desconto" id="calcular-frete" class="input-xlarge">
                                        <button class="btn" type="button" style="margin-bottom: 10px;">Atualizar valor</button>
                                    </div>
                                </div>
                            </fieldset>
                            <hr>
                            <p class="cart-total right">
                                <strong>Sub-Total</strong>: R$100,00<br>
                                <strong>Frete (prévia)</strong>: R$17,50<br>
                                <strong>Cupom (prévia)</strong>: - R$10,50<br>
                                <strong>Total</strong>: R$107,50<br>
                            </p>
                            <hr/>
                            <p class="buttons right">
                                <button class="btn" type="button"><a href="index.html">Continuar comprando</a></button>
                                <button class="btn btn-inverse right" type="submit" id="checkout"><a href="checkout.html">Finalizar compra</a></button>
                            </p>

                        </div>
                        <div class="span3 col">
                            <div class="block">
                                <ul class="nav nav-list">
                                    <li class="nav-header">CATEGORIAS</li>
                                    <li><a href="products.html">Nullam semper elementum</a></li>
                                    <li class="active"><a href="products.html">Phasellus ultricies</a></li>
                                    <li><a href="products.html">Donec laoreet dui</a></li>
                                    <li><a href="products.html">Nullam semper elementum</a></li>
                                    <li><a href="products.html">Phasellus ultricies</a></li>
                                    <li><a href="products.html">Donec laoreet dui</a></li>
                                </ul>
                                <br/>
                                <ul class="nav nav-list below">
                                    <li class="nav-header">MARCAS</li>
                                    <li><a href="products.html">Adidas</a></li>
                                    <li><a href="products.html">Nike</a></li>
                                    <li><a href="products.html">Dunlop</a></li>
                                    <li><a href="products.html">Yamaha</a></li>
                                </ul>
                            </div>
                            <div class="block">
                                <h4 class="title">
                                    <span class="pull-left"><span class="text">Randomize</span></span>
                                    <span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
                                </h4>
                                <div id="myCarousel" class="carousel slide">
                                    <div class="carousel-inner">
                                        <div class="active item">
                                            <ul class="thumbnails listing-products">
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <span class="sale_tag"></span>
                                                        <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                                        <a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
                                                        <a href="#" class="category">Suspendisse aliquet</a>
                                                        <p class="price">R$261</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item">
                                            <ul class="thumbnails listing-products">
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
                                                        <a href="product_detail.html" class="title">Tempor sem sodales</a><br/>
                                                        <a href="#" class="category">Urna nec lectus mollis</a>
                                                        <p class="price">R$134</p>
                                                    </div>
                                                </li>
                                            </ul>
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
            <script>
                $(document).ready(function() {
                    $('#checkout').click(function(e) {
                        document.location.href = "checkout.html";
                    })
                });
            </script>
        </body>

        </html>
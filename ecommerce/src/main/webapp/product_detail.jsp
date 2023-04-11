<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <c:import url="./static/webparts/head.jsp" var="cHead" charEncoding="UTF-8" />
                <c:out value="${cHead}" escapeXml="false" />

                <body>

                    <c:import url="./static/webparts/header_filtros.jsp" var="cHeader" charEncoding="UTF-8" />
                    <c:out value="${cHeader}" escapeXml="false" />

                    <div id="wrapper" class="container">

                        <c:import url="./static/webparts/header_menu.jsp" var="cHeaderMenu" charEncoding="UTF-8" />
                        <c:out value="${cHeaderMenu}" escapeXml="false" />

                        <c:import url="./static/webparts/header_banner.jsp" var="cHeaderBanner" charEncoding="UTF-8" />
                        <c:out value="${cHeaderBanner}" escapeXml="false" />

                        <section class="main-content">
                            <div class="row">
                                <div class="span9">
                                    <div class="row">
                                        <div class="span4">
                                            <a href="static/themes/images/camiseta.png" class="thumbnail" data-fancybox-group="group1" title="Description 1"><img alt="" src="static/themes/images/camiseta.png"></a>
                                            <ul class="thumbnails small">
                                                <li class="span1">
                                                    <a href="static/themes/images/camiseta.png" class="thumbnail" data-fancybox-group="group1" title="Description 2"><img src="static/themes/images/camiseta.png" alt=""></a>
                                                </li>
                                                <li class="span1">
                                                    <a href="static/themes/images/camiseta.png" class="thumbnail" data-fancybox-group="group1" title="Description 3"><img src="static/themes/images/camiseta.png" alt=""></a>
                                                </li>
                                                <li class="span1">
                                                    <a href="static/themes/images/camiseta.png" class="thumbnail" data-fancybox-group="group1" title="Description 4"><img src="static/themes/images/camiseta.png" alt=""></a>
                                                </li>
                                                <li class="span1">
                                                    <a href="static/themes/images/camiseta.png" class="thumbnail" data-fancybox-group="group1" title="Description 5"><img src="static/themes/images/camiseta.png" alt=""></a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="span5">

                                            <c:import url="./static/webparts/section_detalhe_produto.jsp" var="cDetalheProduto" charEncoding="UTF-8" />
                                            <c:out value="${cDetalheProduto}" escapeXml="false" />

                                        </div>
                                        <div class="span5">

                                            <c:import url="./static/webparts/section_form_adicionar_produto.jsp" var="cAdicionarProduto" charEncoding="UTF-8" />
                                            <c:out value="${cAdicionarProduto}" escapeXml="false" />

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span9">
                                            <ul class="nav nav-tabs" id="myTab">
                                                <li class="active"><a href="#home">Descrição</a></li>
                                                <li class=""><a href="#profile">Informações adicionais</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="home">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt
                                                    explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
                                                    ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem</div>
                                                <div class="tab-pane" id="profile">
                                                    <table class="table table-striped shop_attributes">
                                                        <tbody>
                                                            <tr class="">
                                                                <th>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</th>
                                                                <td>Lorem ipsum</td>
                                                            </tr>
                                                            <tr class="alt">
                                                                <th>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</th>
                                                                <td>Lorem ipsum</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span9">

                                            <c:import url="./static/webparts/section_home_produtos.jsp" var="cHomeProdutos" charEncoding="UTF-8" />
                                            <c:out value="${cHomeProdutos}" escapeXml="false" />

                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="span3 col">
                                        <div class="block">
                                            <ul class="nav nav-list">
                                                <li class="nav-header">Categorias</li>
                                                <li><a href="products.jsp">Nullam semper elementum</a></li>
                                                <li class="active"><a href="products.jsp">Phasellus ultricies</a></li>
                                                <li><a href="products.jsp">Donec laoreet dui</a></li>
                                                <li><a href="products.jsp">Nullam semper elementum</a></li>
                                                <li><a href="products.jsp">Phasellus ultricies</a></li>
                                                <li><a href="products.jsp">Donec laoreet dui</a></li>
                                            </ul>
                                            <br/>
                                            <ul class="nav nav-list below">
                                                <li class="nav-header">Marcas</li>
                                                <li><a href="products.jsp">Adidas</a></li>
                                                <li><a href="products.jsp">Nike</a></li>
                                                <li><a href="products.jsp">Puma</a></li>
                                            </ul>
                                        </div>
                                        <div class="block">
                                            <div id="myCarousel" class="carousel slide">
                                                <div class="carousel-inner">
                                                    <div class="active item">
                                                        <ul class="thumbnails listing-products">
                                                            <li class="span3">
                                                                <div class="product-box">
                                                                    <span class="sale_tag"></span>
                                                                    <a href="product_detail.jsp"><img alt="" src="static/themes/images/ladies/7.jpg"></a><br/>
                                                                    <a href="product_detail.jsp" class="title">Fusce id molestie massa</a><br/>
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
                                                                    <a href="product_detail.jsp"><img alt="" src="static/themes/images/ladies/8.jpg"></a><br/>
                                                                    <a href="product_detail.jsp" class="title">Tempor sem sodales</a><br/>
                                                                    <a href="#" class="category">Urna nec lectus mollis</a>
                                                                    <p class="price">R$134</p>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="block">
                                            <h4 class="title"><strong>Mais</strong> vendidos</h4>
                                            <ul class="small-product">
                                                <li>
                                                    <a href="#" title="Praesent tempor sem sodales">
                                                        <img src="static/themes/images/camiseta.png" alt="Praesent tempor sem sodales">
                                                    </a>
                                                    <a href="#">Praesent tempor sem</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="Luctus quam ultrices rutrum">
                                                        <img src="static/themes/images/camiseta.png" alt="Luctus quam ultrices rutrum">
                                                    </a>
                                                    <a href="#">Luctus quam ultrices rutrum</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="Fusce id molestie massa">
                                                        <img src="static/themes/images/camiseta.png" alt="Fusce id molestie massa">
                                                    </a>
                                                    <a href="#">Fusce id molestie massa</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </section>

                    <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                    <c:out value="${cFooter}" escapeXml="false" />

                    </div>

                    <script src="themes/js/common.js"></script>
                    <script>
                        $(function() {
                            $('#myTab a:first').tab('show');
                            $('#myTab a').click(function(e) {
                                e.preventDefault();
                                $(this).tab('show');
                            })
                        })
                        $(document).ready(function() {
                            $('.thumbnail').fancybox({
                                openEffect: 'none',
                                closeEffect: 'none'
                            });

                            $('#myCarousel-2').carousel({
                                interval: 2500
                            });
                        });

                        const produtos = () => {
                            console.log("${produtos}")
                        }

                        const produto = () => {
                            console.log("${produtos}")
                        }
                    </script>
                </body>

                </html>
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

                                    <c:import url="./static/webparts/section_carrinho_detalhes.jsp" var="cCarrinhoDetalhes" charEncoding="UTF-8" />
                                    <c:out value="${cCarrinhoDetalhes}" escapeXml="false" />

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
                                                                <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
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
                                                                <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png"></a><br/>
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
                                </div>
                            </div>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--NAVEGACAO LATERAL-->
                <section>
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
                </section>
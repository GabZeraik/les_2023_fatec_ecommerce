<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

            <!--PRODUTOS-->
            <section id="home-produtos">
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
                                        <c:forEach items="${produtos.dados}" var="item">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <span class="sale_tag"></span>
                                                    <p>
                                                        <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="item." /></a>
                                                    </p>
                                                    <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                    <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                    <p class="price">R$17,20</p>
                                                </div>
                                            </li>
                                        </c:forEach>

                                        <li class="span3">
                                            <div class="product-box">
                                                <span class="sale_tag"></span>
                                                <p>
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                <p class="price">R$32.50</p>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="product-box">
                                                <p>
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                <p class="price">R$14.20</p>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="product-box">
                                                <p>
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
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
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                <p class="price">R$22.30</p>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="product-box">
                                                <p>
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                <p class="price">R$40.25</p>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="product-box">
                                                <p>
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                <p class="price">R$10.45</p>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="product-box">
                                                <p>
                                                    <a href="product_detail.jsp"><img src="static/themes/images/camiseta.png" alt="" /></a>
                                                </p>
                                                <a href="product_detail.jsp" class="title">Lorem ipsum dolor</a><br/>
                                                <a href="products.jsp" class="category">Lorem ipsum dolor</a>
                                                <p class="price">R$35.50</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
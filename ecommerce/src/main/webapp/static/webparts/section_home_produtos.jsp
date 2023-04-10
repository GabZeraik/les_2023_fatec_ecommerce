<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
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
                                            <c:forEach items="${produtos}" var="item" begin="0" end="3">
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <span class="sale_tag"></span>
                                                        <p>
                                                            <a href="product_detail.jsp?id=${item.id}"><img src="static/themes/images/camiseta.png" alt="item.nome" /></a>
                                                        </p>
                                                        <a href="product_detail.jsp?id=${item.id}" class="title">${item.nome}</a><br/>
                                                        <a href="products.jsp" class="category">${item.genero}</a>
                                                        <p class="price">R$${fn:replace(item.preco_atual, '.', ',')}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <ul class="thumbnails">
                                            <c:forEach items="${produtos}" var="item" begin="4" end="7">
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <span class="sale_tag"></span>
                                                        <p>
                                                            <a href="product_detail.jsp?id=${item.id}"><img src="static/themes/images/camiseta.png" alt="item.nome" /></a>
                                                        </p>
                                                        <a href="product_detail.jsp?id=${item.id}" class="title">${item.nome}</a><br/>
                                                        <a href="products.jsp" class="category">${item.genero}</a>
                                                        <p class="price">R$${fn:replace(item.preco_atual, '.', ',')}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
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

                                    <c:import url="./static/webparts/section_produtos_lista.jsp" var="cProdutosLista" charEncoding="UTF-8" />
                                    <c:out value="${cProdutosLista}" escapeXml="false" />

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

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>
                    <script src="themes/js/common.js"></script>
                </body>

                </html>
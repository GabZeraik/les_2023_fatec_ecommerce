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

                        <c:import url="./static/webparts/section_home_slider.jsp" var="cHomeSlider" charEncoding="UTF-8" />
                        <c:out value="${cHomeSlider}" escapeXml="false" />

                        <c:import url="./static/webparts/section_home_texto.jsp" var="cHomeTexto" charEncoding="UTF-8" />
                        <c:out value="${cHomeTexto}" escapeXml="false" />

                        <section class="main-content">
                            <div class="row">
                                <div class="span12">

                                    <c:import url="./static/webparts/section_home_produtos.jsp" var="cHomeProdutos" charEncoding="UTF-8" />
                                    <c:out value="${cHomeProdutos}" escapeXml="false" />

                                    <br/>

                                    <c:import url="./static/webparts/section_home_servicos.jsp" var="cHomeServicos" charEncoding="UTF-8" />
                                    <c:out value="${cHomeServicos}" escapeXml="false" />

                                </div>
                            </div>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>
                    <script src="static/themes/js/common.js"></script>
                    <script src="static/themes/js/jquery.flexslider-min.js"></script>
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

                        const usuario = () => {
                            console.log("${usuario_logado}")
                        }

                        const produtos = () => {
                            console.log("${produtos}")
                        }

                        const bandeiras = () => {
                            console.log("${bandeiras}")
                        }
                    </script>
                </body>

                </html>
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
                                    <h4 class="title"><span class="text"><strong>Meu</strong> Carrinho</span></h4>

                                    <c:import url="./static/webparts/section_carrinho_detalhes.jsp" var="cCarrinhoDetalhes" charEncoding="UTF-8">
                                        <c:param name="cCarrinho" value="true" />
                                    </c:import>
                                    <c:out value="${cCarrinhoDetalhes}" escapeXml="false" />

                                </div>

                                <c:import url="./static/webparts/section_produtos_side_nav.jsp" var="cSideNav" charEncoding="UTF-8" />
                                <c:out value="${cSideNav}" escapeXml="false" />

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

                        const formAlterarQuantidadeItem = document.querySelector('#formAlterarQuantidadeItem');
                        const alterarQuantidadeItemCarrinho = () => {
                            let inputs = document.querySelectorAll('input[name="input_quantidade_item"]');
                            inputs.forEach(input => {
                                let input_form = document.querySelector("#alterado_" + input.id);
                                if (input_form) input_form.setAttribute("value", input.value);
                                else formAlterarQuantidadeItem.insertAdjacentHTML('afterbegin', "<input type='number' name='item_carrinho_" + input.getAttribute('data-item_id') + "' value='" + input.value + "' id='alterado_" + input.id + "'>");
                            })
                        }
                    </script>
                </body>

                </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--LISTA PRODUTOS-->
                <section>
                    <ul class="thumbnails listing-products">
                        <c:forEach items="${produtos}" var="item" varStatus="loop">
                            <li class="span3">
                                <div class="product-box">
                                    <span class="sale_tag"></span>
                                    <p>
                                        <a href="ConsultarProduto?operacao=CONSULTAR&pro_id=${item.id}"><img src="static/themes/images/camiseta.png" alt="item.nome" /></a>
                                    </p>
                                    <a href="ConsultarProduto?operacao=CONSULTAR&pro_id=${item.id}" class="nome">${item.nome}</a><br/>
                                    <a href="products.jsp" class="genero">${item.genero}</a>
                                    <p class="preco">R$${fn:replace(item.preco_atual, '.', ',')}</p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <hr>
                    <div class="pagination pagination-small pagination-centered">
                        <ul>
                            <li><a href="#">Anterior</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">Próximo</a></li>
                        </ul>
                    </div>
                </section>
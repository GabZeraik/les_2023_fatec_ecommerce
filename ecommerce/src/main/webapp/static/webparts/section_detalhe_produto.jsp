<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--DETALHE PRODUTO-->
                <section>
                    <h4><strong>${resultado.dados[0].nome}</strong></h4>
                    <address>
                        <strong>Categorias: </strong>
                            <span>
                                <c:forEach items="${resultado.dados[0].categoria}" var="categoria" varStatus="loop">
                                    ${categoria.nome}${!loop.last ? ', ' : ''} 
                                </c:forEach>
                            </span><br>
                        <strong>Código : </strong><span>${resultado.dados[0].codigo}</span><br>
                        <div class="control-group">
                            <label class="control-label"><strong>Tamanho: </strong></label>
                            <select class="controls" id="select_tamanho_item" required>
                                <option value="${resultado.dados[0].tamanho}">${resultado.dados[0].tamanho}</option>
                            </select>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><strong>Cor: </strong></label>
                            <select class="controls" id="select_cor_item" required>
                                <option value="${resultado.dados[0].cor}">${resultado.dados[0].cor}</option>
                            </select>
                        </div>
                        <strong>Estoque:</strong> <span>NÃO IMPLEMENTADO</span><br>								
                    </address>
                    <h4><strong>R$${fn:replace(resultado.dados[0].preco_atual, '.', ',')}</strong></h4>
                </section>
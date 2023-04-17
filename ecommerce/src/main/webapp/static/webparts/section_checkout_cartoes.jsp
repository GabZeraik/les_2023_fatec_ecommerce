<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <!--CARRINHO CARTOES-->
                <section class="cartoes_disponiveis">
                    <fieldset>
                        <c:forEach var="cartao" items="${usuario_logado.cartao}">
                            <div class="card" onclick="selecionaCartao(this)">
                                <input type="checkbox" name="cartao_selecionado" value="${cartao.id}" id="cartao_${cartao.id}" class="hidden">
                                <div class="visa_logo">
                                    <c:choose>
                                        <c:when test="${cartao.bandeira.nome == 'VISA'}">
                                            <img src="static\themes\images\img_visa.svg" alt="VISA">
                                        </c:when>
                                        <c:when test="${cartao.bandeira.nome == 'MASTERCARD'}">
                                            <img src="static\themes\images\img_mastercard.svg" alt="MASTERCARD">
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="visa_info">
                                    <p class="text"><strong>${cartao.numero}</strong></p>
                                </div>
                                <div class="visa_crinfo">
                                    <p class="text">${cartao.validade}</p>
                                    <p class="text">${cartao.nome_impresso}</p>
                                </div>
                            </div>
                            <div class="visa_valor hidden">
                                <label class="control-label" for="valor_a_ser_pago_${cartao.id}">Valor a ser pago*:</label>
                                <div class="controls">
                                    <input type="text" placeholder="R$" id="valor_a_ser_pago_${cartao.id}" name="valor_a_ser_pago_${cartao.id}" class="input-small" required>
                                </div>
                            </div>
                            <hr>
                            <br>
                        </c:forEach>
                    </fieldset>
                </section>
                <section class="cadastrar_novo_cartao">
                    <button type="button">
                        <a class="accordion-toggle" data-toggle="collapse" href="#cadastrar_novo_cartao">
                            <h4><span class="text"><strong>Cadastrar</strong> novo cartão</span></h4>
                        </a>
                    </button>
                    <div id="cadastrar_novo_cartao" class="accordion-body collapse js-liberar-edicao">
                        <form id="formCadastrarNovoCartao" action="CadastrarCartaoCheckout" method="POST">
                            <div class="accordion-inner">
                                <div class="row-fluid">
                                    <div class="span5 col">
                                        <fieldset>
                                            <input type="hidden" id="formCadastrarNovoCartao_id" name="cartao_cliente_id" value="${usuario_logado.id}">
                                            <input type="hidden" name="cartao_preferencial" value="1">
                                            <div class="control-group">
                                                <label class="control-label">Número do cartão*:</label>
                                                <div class="controls">
                                                    <input type="text" id="cartao_numero" name="cartao_numero" class="input-xlarge" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Bandeira*:</label>
                                                <select class="controls" id="cartao_bandeira" name="cartao_bandeira" required>
                                            <c:forEach var="bandeira" items="${bandeiras}">
                                                <option value="${bandeira.id}">${bandeira.nome}</option>
                                            </c:forEach>
                                        </select>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Validade*:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="MM/AA" id="cartao_validade" name="cartao_validade" class="input-mini" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">CVV*:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="CVV" id="cartao_cvv" name="cartao_cvv" class="input-mini" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Nome no cartão*:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="Digite o nome impresso" id="cartao_nome" name="cartao_nome" class="input-xlarge" required>
                                                </div>
                                            </div>
                                            <div class="actions span3" style="float: right"><input tabindex="9" form="formCadastrarNovoCartao" class="btn btn-inverse large" type="submit" name="operacao" value="SALVAR"></div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
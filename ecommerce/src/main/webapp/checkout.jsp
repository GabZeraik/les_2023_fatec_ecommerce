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
                                <div class="span12">

                                    <c:import url="./static/webparts/section_dados_checkout.jsp" var="cDados" charEncoding="UTF-8" />
                                    <c:out value="${cDados}" escapeXml="false" />

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                                                <h4 class="title"><span class="text"><strong>Finalizar compra</strong></span></h4>
                                            </a>
                                        </div>
                                        <div id="collapseThree" class="accordion-body collapse">
                                            <div class="accordion-inner">
                                                <div class="row-fluid">
                                                    <div class="span6">
                                                        <h4 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h4>

                                                        <c:import url="./static/webparts/section_carrinho_detalhes.jsp" var="cCarrinhoDetalhes" charEncoding="UTF-8">
                                                            <c:param name="cCarrinho" value="false" />
                                                        </c:import>
                                                        <c:out value="${cCarrinhoDetalhes}" escapeXml="false" />

                                                    </div>
                                                    <div class="span6">
                                                        <h4 class="title"><span class="text"><strong>Utilizar</strong> cupom</span></h4>
                                                        <fieldset>
                                                            <div class="control-group">
                                                                <label class="checkbox" for="cupom_1">
                                                                    <input type="checkbox" value="cupom_1" id="cupom_1">R$50,00
                                                                </label>
                                                                <label class="checkbox" for="cupom_2">
                                                                    <input type="checkbox" value="cupom_2" id="cupom_2">R$123,20
                                                                </label>
                                                            </div>
                                                        </fieldset>
                                                        <fieldset>
                                                            <h4 class="title"><span class="text"><strong>Forma</strong> de pagamento</span></h4>
                                                            <label class="control-group card">
                                                            <input type="checkbox" value="cartao_1" id="cartao_1">
                                                            <div class="thumbnails small">
                                                                <img src="https://www.freepnglogos.com/uploads/mastercard-png/file-mastercard-logo-svg-wikimedia-commons-4.png" alt="">
                                                            </div>
                                                            <div>
                                                                <span class="text"><strong>**** **** **** 1060</strong></span>
                                                            </div>
                                                            <div>
                                                                <span class="text"><strong>Válido até: </strong>10/26</span>
                                                                <span class="text"><strong>Nome: </strong>Lorem ipsum</span>
                                                            </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Valor a ser pago*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="R$" id="valor_a_ser_pago_cartao_1" class="input-small" required>
                                                            </div>
                                                    </div>
                                                    </label>
                                                    <label class="control-group card">
                                                    <input type="checkbox" value="cartao_2" id="cartao_2">
                                                    <div class="thumbnails small">
                                                        <img src="https://www.freepnglogos.com/uploads/visa-logo-download-png-21.png" alt="">
                                                    </div>
                                                    <div>
                                                        <span class="text"><strong>**** **** **** 9989</strong></span>
                                                    </div>
                                                    <div>
                                                        <span class="text"><strong>Válido até: </strong>10/23</span>
                                                        <span class="text"><strong>Nome: </strong>Lorem ipsum Lorem</span>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Valor a ser pago*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="R$" id="valor_a_ser_pago_cartao_2" class="input-small" required>
                                                    </div>
                                                </div>
                                                </label>
                                                </fieldset>
                                                <div class="card">
                                                    <label class="radio" for="cb_cadastrar_novo_cartao">
                                                    <input type="checkbox" value="cadastrar_novo_card" id="cb_cadastrar_novo_cartao" onchange="radioHandlerCartao(this);">Cadastrar novo cartão
                                                </label>
                                                    <div class="hidden" id="div_novo_cartao">
                                                        <form action="#" method="post" id="form_cadastrar_cartao">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label">Número do cartão*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" id="cartao_numero" class="input-xlarge" required>
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Bandeira*:</label>
                                                                    <select class="controls" id="cartao_bandeira" required>
                                                                    <option value="visa">VISA</option>
                                                                    <option value="mastercard">MasterCard</option>
                                                                    <option value="elo">Elo</option>
                                                                </select>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Validade*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" placeholder="MM/AA" id="cartao_validade" class="input-mini" required>
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">CVV*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" placeholder="CVV" id="cartao_cvv" class="input-mini" required>
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Nome no cartão*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" placeholder="Digite o nome impresso" id="cartao_nome" class="input-xlarge" required>
                                                                    </div>
                                                                </div>
                                                                <div class="actions" style="float: right" id="btn_cadastrar_cartao"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Vincular cartão"></div>
                                                            </fieldset>
                                                        </form>
                                                        <div class="control-group">
                                                            <label class="control-label">Valor a ser pago*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="R$" id="valor_a_ser_pago_novo_cartao" class="input-small" required>
                                                            </div>
                                                        </div>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="span12" style="margin-top: 25px; display: flex; flex-direction: row; justify-content: space-evenly;">
                                                <button class="btn" type="button"><a href="index.jsp">Continuar comprando</a></button>
                                                <button class="btn btn-inverse right" type="submit" id="checkout"><a href="CheckoutCarrinho?operacao=FINALIZAR&logado=${usuario_logado.id}">Finalizar Compra</a></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>
                    <script src="static/js/crud_cliente.js"></script>
                    <script src="themes/js/common.js"></script>
                </body>
                <script type="text/javascript">
                    const formEntrega = document.querySelector('#div_endereco_entrega');
                    const btnContinuar = document.querySelector('#btn_continuar');
                    const formCartao = document.querySelector('#div_novo_cartao');

                    let radioHandlerEndereco = (myRadio) => {
                        formEntrega.classList.toggle('hidden', myRadio.value.includes("endereco"));
                        btnContinuar.classList.toggle('hidden', !myRadio.value.includes("endereco"));
                    }

                    let radioHandlerCartao = (myRadio) => {
                        formCartao.classList.toggle('hidden');
                    }

                    const formAlteracao = document.querySelector('#editar_cadastro_cliente');
                    const formStatus = document.querySelector('#editar_status_cliente');
                    const json_resultado = JSON.parse('${usuario_logado.json}');
                    const container_enderecos_entrega = document.querySelector('.js-container-enderecos-entrega');
                    const cliente_id_inputs = document.querySelectorAll('input[name*="cliente_id"]');

                    const liberarEdicaoAccordion = (button) => {
                        let inputs = button.closest('.js-liberar-edicao').querySelectorAll('input, select, textarea');
                        inputs.forEach(input => {
                            if (input.type == "submit")
                                input.classList.toggle('hidden')
                            else input.toggleAttribute('readonly');
                        });
                    }

                    const preencheEnderecos = (dados_cliente) => {
                        container_enderecos_entrega.innerHTML = '';
                        dados_cliente.endereco.forEach(end => {
                            console.log(end);
                            let linha_endereco = new LinhaEndereco(end).criaLinhaEndereco();
                            if (end.tipo == "ENTREGA") {
                                container_enderecos_entrega.insertAdjacentHTML('beforeend', linha_endereco);
                            }
                        })
                    }

                    const statusHandler = (botao) => {
                        formAlteracao.classList.toggle('hidden', true);
                        formStatus.classList.toggle('hidden', false);
                    }

                    preencheEnderecos(json_resultado);
                </script>

                </html>
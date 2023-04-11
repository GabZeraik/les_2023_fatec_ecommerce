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
                                                        <table class="table table-striped table-hover">
                                                            <thead>
                                                                <tr>

                                                                    <th>Imagem</th>
                                                                    <th>Produto</th>
                                                                    <th>Quantidade</th>
                                                                    <th>Preço Unitário</th>
                                                                    <th>Total</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>

                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Fusce id molestie massa</td>
                                                                    <td><input type="text" value="1" class="input-mini"></td>
                                                                    <td>R$2.350,00</td>
                                                                    <td>R$2.350,00</td>
                                                                </tr>
                                                                <tr>

                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                    <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                    <td>R$1.150,00</td>
                                                                    <td>R$2.450,00</td>
                                                                </tr>
                                                                <tr>

                                                                    <td>
                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                    </td>
                                                                    <td>Wuam ultrices rutrum</td>
                                                                    <td><input type="text" placeholder="1" value="1" class="input-mini"></td>
                                                                    <td>R$1.210,00</td>
                                                                    <td>R$1.123,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td><strong>R$3.600,00</strong></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
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
                                        <button class="btn btn-inverse pull-right">Finalizar compra</button>
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
                    const container_enderecos_cobranca = document.querySelector('.js-container-enderecos-cobranca');
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
                        container_enderecos_cobranca.innerHTML = '';

                        dados_cliente.endereco.forEach(end => {
                            console.log(end);
                            let linha_endereco = new LinhaEndereco(end).criaLinhaEndereco();
                            if (end.tipo == "ENTREGA") {
                                container_enderecos_entrega.insertAdjacentHTML('beforeend', linha_endereco);
                            } else container_enderecos_cobranca.insertAdjacentHTML('beforeend', linha_endereco);
                        })
                    }

                    const statusHandler = (botao) => {
                        formAlteracao.classList.toggle('hidden', true);
                        formStatus.classList.toggle('hidden', false);
                    }

                    const funcaoExcluir = (form, id) => {
                        form.action = "ExcluirCliente";
                        let operacao_id = "form_operacao_" + id;
                        document.getElementById(operacao_id).value = "EXCLUIR";
                        form.submit();
                    }

                    const funcaoAlterar = (form, id) => {
                        let selector = 'input[id*="form_' + id + '"], select[id*="form_' + id + '"]';
                        let inputs = document.querySelectorAll(selector);
                        let inputs_form_alterar = document.querySelectorAll('#formAlterarCadastroParcial input, #formAlterarCadastroParcial select')

                        inputs_form_alterar.forEach(input => {
                            let filtered = Array.from(inputs).filter((value) => value.getAttribute('name') == input.getAttribute('name'));
                            if (filtered.length) {
                                input.value = filtered[0].value;
                            }
                        });
                    }

                    const buttonHandler = (botao) => {
                        let id = botao.id.split('_')[1];
                        let form_id = 'formDadosCliente_' + id;
                        let form = document.getElementById(form_id);
                        switch (botao.value) {
                            case "EXCLUIR":
                                funcaoExcluir(form, id);
                                break;
                            case "ALTERAR":
                                //pegar os itens de cada input do form e preencher os inputs do formulário específico
                                funcaoAlterar(form, id);
                                break;
                        }
                    }

                    preencheEnderecos(json_resultado);

                    const getValor = (item) => {
                        console.log(item);
                    }
                </script>

                </html>
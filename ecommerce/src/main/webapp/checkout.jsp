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

                                    <section class="finalizar-compra">
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

                                                            <c:import url="./static/webparts/section_checkout_cupons.jsp" var="cCheckoutCupons" charEncoding="UTF-8" />
                                                            <c:out value="${cCheckoutCupons}" escapeXml="false" />


                                                            <fieldset>
                                                                <h4 class="title"><span class="text"><strong>Forma</strong> de pagamento</span></h4>

                                                                <c:import url="./static/webparts/section_checkout_cartoes.jsp" var="cCheckoutCartoes" charEncoding="UTF-8" />
                                                                <c:out value="${cCheckoutCartoes}" escapeXml="false" />

                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>

                                                <c:import url="./static/webparts/section_checkout_form_finalizar.jsp" var="cFormFinalizar" charEncoding="UTF-8" />
                                                <c:out value="${cFormFinalizar}" escapeXml="false" />

                                            </div>
                                        </div>
                                    </section>
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
                    const formAlterarQuantidadeItem = document.querySelector('#formAlterarQuantidadeItem');

                    const radioHandlerEndereco = (myRadio) => {
                        formEntrega.classList.toggle('hidden', myRadio.value.includes("endereco"));
                        btnContinuar.classList.toggle('hidden', !myRadio.value.includes("endereco"));
                    }

                    const radioHandlerCartao = (myRadio) => {
                        formCartao.classList.toggle('hidden');
                    }

                    const calculaValorTotalFinal = () => {
                        //VALOR FINAL
                        let valorFinalCarrinho = 0;
                        let valorFinalCalculoPedido = 0;
                        let valorFrete = 0;
                        let valorCupom = 0;
                        let cupons_selecionados = document.querySelectorAll('input[id^="selecionado_cupom"]');

                        //CARRINHO
                        valorFinalCarrinho = Number(span_sub_total.textContent.split("R$")[1].replace(',', '.'));
                        valorFinalCalculoPedido = valorFinalCarrinho;

                        //FRETE
                        try {
                            let endereco_selecionado_id = [...document.querySelectorAll('input[name="endereco_selecionado_id"')].filter(el => el.checked)[0].value;
                            let cep_selecionado = document.querySelector('#formAlterarEndereco_' + CSS.escape(endereco_selecionado_id) + ' input[name="endereco_entrega_cep_cliente"]').value;
                            let porcentagem_frete = fretes.filter(frete => String(frete.codigo).padStart(3, 0) === cep_selecionado.slice(0, 3))[0].porcentagem;
                            valorFrete = valorFinalCarrinho * Number(porcentagem_frete);
                            valorFinalCalculoPedido += valorFrete;
                            valorFrete = "R$ " + valorFrete.toFixed(2);
                        } catch (error) {
                            valorFrete = "";
                        }

                        //CUPOM
                        if (cupons_selecionados) {
                            cupons_selecionados.forEach(elem => valorCupom += Number(elem.getAttribute('valor_cupom')));
                            valorFinalCalculoPedido = valorFinalCalculoPedido - valorCupom;
                            valorCupom = "-R$ " + valorCupom.toFixed(2);
                        } else {
                            valorCupom = "";
                        }

                        span_frete.textContent = valorFrete.replace('.', ',');
                        span_cupom.textContent = valorCupom.replace('.', ',');
                        span_total_final.textContent = "R$" + valorFinalCalculoPedido.toFixed(2).replace('.', ',');
                        input_valor_total_pedido_final.value = Number(valorFinalCalculoPedido.toFixed(2));
                    }

                    const checkboxCuponsHandler = (checkbox) => {
                        const cupom_id = checkbox.id.split('_')[1];
                        const id_selecionado = "selecionado_".concat(checkbox.id);
                        const input_cupom = document.querySelector('#' + id_selecionado);

                        //SELECIONA O PRÓPRIO E DESSELECIONA OS OUTROS
                        if (checkbox.checked) {
                            if (!input_cupom) {
                                div_cupom_selecionado_form.insertAdjacentHTML('afterbegin', "<input type='hidden' name='cupom_selecionado' valor_cupom='" + checkbox.value + "' value='" + cupom_id + "' id='" + id_selecionado + "'>");
                            }
                        } else {
                            if (input_cupom) {
                                input_cupom.remove();
                            }
                        }

                        calculaValorTotalFinal();
                    }

                    const formAlteracao = document.querySelector('#editar_cadastro_cliente');
                    const formStatus = document.querySelector('#editar_status_cliente');
                    const container_enderecos_entrega = document.querySelector('.js-container-enderecos-entrega');
                    const cliente_id_inputs = document.querySelectorAll('input[name*="cliente_id"]');
                    const input_quantidade_cartoes_selecionados = document.querySelector('#input_quantidade_cartoes_selecionados');
                    const json_resultado = JSON.parse('${usuario_logado}');
                    const carrinho = JSON.parse('${carrinho}');
                    const fretes = JSON.parse('${fretes}');

                    const span_sub_total = document.querySelector('#span_resumo_sub_total');
                    const span_frete = document.querySelector('#span_resumo_frete');
                    const span_cupom = document.querySelector('#span_resumo_cupom');
                    const span_total_final = document.querySelector('#span_resumo_total_final');

                    const form_finalizar = document.querySelector('#formFinalizarCompra');
                    const inputs_cupons_disponiveis = document.querySelectorAll('section.cupons_disponiveis input[type="checkbox"]');
                    const div_cupom_selecionado_form = document.querySelector('#cupom_selecionado');
                    const input_valor_total_pedido_final = document.querySelector('#valor_total_pedido_final');


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
                            let linha_endereco = new LinhaEndereco(end, "required").criaLinhaEndereco();
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

                    const selecionaCartao = (checkboxCartao) => {
                        checkboxCartao.href = '#';
                        checkboxCartao.firstElementChild.checked = !checkboxCartao.firstElementChild.checked;
                        checkboxCartao.classList.toggle('selected');
                        checkboxCartao.nextElementSibling.classList.toggle('hidden', checkboxCartao.selected);

                        let id = checkboxCartao.firstElementChild.id.split('_')[1];

                        if (checkboxCartao.firstElementChild.checked) {
                            form_finalizar.appendChild(checkboxCartao.firstElementChild.cloneNode(true));
                            let input_valor_cartao = document.querySelector('#valor_a_ser_pago_' + CSS.escape(id)).cloneNode(true);
                            input_valor_cartao.type = "hidden";
                            form_finalizar.appendChild(input_valor_cartao);
                        } else {
                            try {
                                let input_cartao_selecionado = document.querySelector('#formFinalizarCompra #cartao_' + CSS.escape(id));
                                let input_valor_cartao = document.querySelector('#formFinalizarCompra #valor_a_ser_pago_' + CSS.escape(id));
                                input_cartao_selecionado.remove();
                                input_valor_cartao.remove();
                            } catch (error) {

                            };
                        }
                    }

                    const submitFormulario = (botaoSubmit) => {
                        let inputs_cartoes = [...document.querySelectorAll('section.cartoes_disponiveis input')];
                        inputs_cartoes = inputs_cartoes.filter((el, index) =>
                            (el.id.includes('cartao') && el.checked) || (!el.id.includes('cartao') && !el.parentElement.parentElement.classList.contains("hidden"))
                        );

                        inputs_cartoes.forEach(el => {
                            document.querySelector('#formFinalizarCompra #' + CSS.escape(el.id)).value = el.value;
                        });

                        document.querySelector('#formFinalizarCompra').submit();
                    }

                    const alterarQuantidadeItemCarrinho = () => {
                        let inputs = document.querySelectorAll('input[name="input_quantidade_item"]');
                        inputs.forEach(input => {
                            let input_form = document.querySelector("#alterado_" + input.id);
                            if (input_form) input_form.setAttribute("value", input.value);
                            else formAlterarQuantidadeItem.insertAdjacentHTML('afterbegin', "<input type='number' name='item_carrinho_" + input.getAttribute('data-item_id') + "' value='" + input.value + "' id='alterado_" + input.id + "'>");
                        })
                    }

                    calculaValorTotalFinal();
                </script>

                </html>
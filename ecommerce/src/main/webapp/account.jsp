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

                        <section id="editar_cadastro_cliente">
                            <div class="row">
                                <div class="span12">
                                    <form id="formDadosCliente_${usuario_logado.id}" action="" method="post">
                                        <input type="hidden" id="form_operacao_${usuario_logado.id}" name="operacao" class="input-xlarge hidden" value="">
                                        <input type="hidden" id="form_${usuario_logado.id}_id" name="id_cliente" class="input-xlarge" value="${usuario_logado.id}">
                                        <input type="hidden" id="form_${usuario_logado.id}_usuario" name="usuario_cliente" class="input-xlarge" value="${usuario_logado.usuario}">
                                        <input type="hidden" id="form_${usuario_logado.id}_senha" name="senha_cliente" class="input-xlarge" value="${usuario_logado.senha}">
                                        <input type="hidden" id="form_${usuario_logado.id}_nome" name="nome_cliente" class="input-xlarge" value="${usuario_logado.nome}">
                                        <input type="hidden" id="form_${usuario_logado.id}_data_nascimento" name="data_nascimento_cliente" class="input-xlarge" value="${usuario_logado.dta_nascimento}">
                                        <input type="hidden" id="form_${usuario_logado.id}_genero" name="genero_cliente" class="input-xlarge" value="${usuario_logado.genero}">
                                        <input type="hidden" id="form_${usuario_logado.id}_cpf" name="cpf_cliente" class="input-xlarge" value="${usuario_logado.cpf}">
                                        <input type="hidden" id="form_${usuario_logado.id}_email" name="email_cliente" class="input-xlarge" value="${usuario_logado.email}">
                                        <input type="hidden" id="form_${usuario_logado.id}_telefone_ddd" name="telefone_ddd_cliente" class="input-mini" value="${usuario_logado.telefone.ddd}">
                                        <input type="hidden" id="form_${usuario_logado.id}_telefone_numero" name="telefone_numero_cliente" class="input-small" value="${usuario_logado.telefone.numero}">
                                        <input type="hidden" id="form_${usuario_logado.id}_telefone_tipo" name="telefone_tipo_cliente" class="input-small" value="${usuario_logado.telefone.tipo}">
                                    </form>

                                    <c:import url="./static/webparts/section_pedidos.jsp" var="cSectionPedidos" charEncoding="UTF-8" />
                                    <c:out value="${cSectionPedidos}" escapeXml="false" />

                                    <br>

                                    <c:import url="./static/webparts/section_dados_cliente.jsp" var="cSectionDadosCliente" charEncoding="UTF-8" />
                                    <c:out value="${cSectionDadosCliente}" escapeXml="false" />

                                    <br>

                                    <c:import url="./static/webparts/section_enderecos_cliente.jsp" var="cSectionEnderecosCliente" charEncoding="UTF-8" />
                                    <c:out value="${cSectionEnderecosCliente}" escapeXml="false" />

                                    <br>

                                    <c:import url="./static/webparts/section_cupons_cliente.jsp" var="cSectionCuponsCliente" charEncoding="UTF-8" />
                                    <c:out value="${cSectionCuponsCliente}" escapeXml="false" />

                                    <br>

                                    <c:import url="./static/webparts/section_cartoes_cliente_2.jsp" var="cSectionCartoesCliente" charEncoding="UTF-8" />
                                    <c:out value="${cSectionCartoesCliente}" escapeXml="false" />

                                </div>
                            </div>
                        </section>

                        <c:import url="./static/webparts/footer.jsp" var="cFooter" charEncoding="UTF-8" />
                        <c:out value="${cFooter}" escapeXml="false" />

                    </div>

                    <script src="static/js/crud_cliente.js"></script>
                    <script type="text/javascript">
                        const formAlteracao = document.querySelector('#editar_cadastro_cliente');
                        const formStatus = document.querySelector('#editar_status_cliente');
                        const container_enderecos_entrega = document.querySelector('.js-container-enderecos-entrega');
                        const container_enderecos_cobranca = document.querySelector('.js-container-enderecos-cobranca');
                        const cliente_id_inputs = document.querySelectorAll('input[name*="cliente_id"]');
                        const usuario_logado = JSON.parse('${usuario_logado.json}');


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
                                let linha_endereco = new LinhaEndereco(end).criaLinhaEndereco();
                                if (end.tipo == "ENTREGA") {
                                    container_enderecos_entrega.insertAdjacentHTML('beforeend', linha_endereco);
                                } else container_enderecos_cobranca.insertAdjacentHTML('beforeend', linha_endereco);
                            })
                        }

                        const editHandler = (botao, cli_id) => {
                            if (formStatus) formStatus.classList.toggle('hidden', true);
                            formAlteracao.classList.toggle('hidden', false);

                            cliente_id_inputs.forEach(input => input.value = usuario_logado.id);

                            preencheEnderecos(usuario_logado);
                            //buttonHandler(botao);
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

                        funcaoAlterar(null, "${usuario_logado.id}");
                        editHandler(null, "${usuario_logado.id}");
                        console.log("${bandeiras}")
                    </script>
                </body>

                </html>
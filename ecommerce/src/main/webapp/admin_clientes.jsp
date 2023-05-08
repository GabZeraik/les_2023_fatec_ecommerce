<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <c:import url="./static/webparts/head.jsp" var="cHead" charEncoding="UTF-8" />
                <c:out value="${cHead}" escapeXml="false" />

                <body>
                    <div id="top-bar" class="container">
                        <div class="row">
                            <form action="ConsultarCliente" method="GET" id="formConsultarCliente">
                                <div class="span4">
                                    <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                                </div>
                                <div class="span6 col">
                                    <h4 class="title">Filtros</h4>
                                    <ul>
                                        <li>Status<input type="text" id="filtro_situacao_cliente" name="situacao_cliente" class="input-block-level search-query"></li>
                                        <li>Código<input type="text" id="filtro_codigo_cliente" name="codigo_cliente" class="input-block-level search-query"></li>
                                        <li>Nome completo<input type="text" id="filtro_nome_cliente" name="nome_cliente" class="input-block-level search-query"></li>
                                        <li>Data de nascimento<input type="text" id="filtro_data_nascimento_cliente" name="data_nascimento_cliente" class="input-block-level search-query"></li>
                                        <li>Gênero<input type="text" id="filtro_genero_cliente" name="genero_cliente" class="input-block-level search-query"></li>
                                        <li>CPF<input type="text" id="filtro_cpf_cliente" name="cpf_cliente" class="input-block-level search-query"></li>
                                        <li>Email<input type="text" id="filtro_email_cliente" name="email_cliente" class="input-block-level search-query"></li>
                                        <li>Telefone<input type="text" id="filtro_telefone_ddd_cliente" name="telefone_ddd_cliente" class="input-block-level search-query"></li>
                                        <li>Ranking<input type="text" id="filtro_ranking_cliente" name="ranking_cliente" class="input-block-level search-query"></li>
                                    </ul>
                                    <div class="actions" style="float: right"><input class="btn btn-inverse large" form="formConsultarCliente" type="submit" name="operacao" value="CONSULTAR" id="botao_consultar"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="wrapper" class="container">
                        <section class="main-content">
                            <div class="row">
                                <div class="span12">
                                    <h4 class="title"><span class="text"><strong>ADMINISTRAÇÃO</strong> Clientes</span></h4>
                                    <table id="tabela_resultado" class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Status</th>
                                                <th>Usuário</th>
                                                <th>Nome completo</th>
                                                <th>Data de nascimento</th>
                                                <th>Gênero</th>
                                                <th>CPF</th>
                                                <th>Email</th>
                                                <th>Telefone</th>
                                                <th>Ranking</th>
                                                <th>Cat. Status/Justificativa</th>
                                                <th colspan="3"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${resultado != null && resultado.operacao == 'CONSULTAR'}">
                                                    <c:choose>
                                                        <c:when test="${resultado.dados.size() > 0}">
                                                            <c:forEach items="${resultado.dados}" var="item">
                                                                <tr>
                                                                    <td>${item.situacao}</td>
                                                                    <td>${item.usuario}</td>
                                                                    <td>${item.nome}</td>
                                                                    <td>${item.dta_nascimento}</td>
                                                                    <td>${item.genero}</td>
                                                                    <td>${item.cpf}</td>
                                                                    <td>${item.email}</td>
                                                                    <td>(${item.telefone.ddd})${item.telefone.numero} - ${item.telefone.tipo}</td>
                                                                    <td>${item.ranking}</td>
                                                                    <td>${item.justificativa}</td>
                                                                    <td></td>
                                                                    <td><button onclick="editHandler(this, '${item.id}')" data-form="formDadosCliente_${item.id}" id="alterar_${item.id}" value="ALTERAR">Editar</button></td>
                                                                    <td><button onclick="buttonHandler(this)" data-form="formDadosCliente_${item.id}" id="excluir_${item.id}" value="EXCLUIR">Excluir</button></td>
                                                                    <td><button onclick="statusHandler(this)">Inativar</button></td>
                                                                </tr>
                                                                <form id="formDadosCliente_${item.id}" action="" method="post">
                                                                    <input type="hidden" id="form_operacao_${item.id}" name="operacao" class="input-xlarge hidden" value="">
                                                                    <input type="hidden" id="form_${item.id}_id" name="id_cliente" class="input-xlarge" value="${item.id}">
                                                                    <input type="hidden" id="form_${item.id}_usuario" name="usuario_cliente" class="input-xlarge" value="${item.usuario}">
                                                                    <input type="hidden" id="form_${item.id}_senha" name="senha_cliente" class="input-xlarge" value="${item.senha}">
                                                                    <input type="hidden" id="form_${item.id}_nome" name="nome_cliente" class="input-xlarge" value="${item.nome}">
                                                                    <input type="hidden" id="form_${item.id}_data_nascimento" name="data_nascimento_cliente" class="input-xlarge" value="${item.dta_nascimento}">
                                                                    <input type="hidden" id="form_${item.id}_genero" name="genero_cliente" class="input-xlarge" value="${item.genero}">
                                                                    <input type="hidden" id="form_${item.id}_cpf" name="cpf_cliente" class="input-xlarge" value="${item.cpf}">
                                                                    <input type="hidden" id="form_${item.id}_email" name="email_cliente" class="input-xlarge" value="${item.email}">
                                                                    <input type="hidden" id="form_${item.id}_telefone_ddd" name="telefone_ddd_cliente" class="input-mini" value="${item.telefone.ddd}">
                                                                    <input type="hidden" id="form_${item.id}_telefone_numero" name="telefone_numero_cliente" class="input-small" value="${item.telefone.numero}">
                                                                    <input type="hidden" id="form_${item.id}_telefone_tipo" name="telefone_tipo_cliente" class="input-small" value="${item.telefone.tipo}">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_frase_curta" name="endereco_entrega_frase_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_tipo_residencia" name="endereco_entrega_tipo_residencia_cliente">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_cep" name="endereco_entrega_cep_cliente" class="input-small">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_tipo_logradouro" name="endereco_entrega_tipo_logradouro_cliente">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_logradouro" name="endereco_entrega_logradouro_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_numero" name="endereco_entrega_numero_cliente" class="input-mini">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_bairro" name="endereco_entrega_bairro_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_cidade" name="endereco_entrega_cidade_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_estado" name="endereco_entrega_estado_cliente" class="input-mini">
                                                                    <input type="hidden" id="form_${item.id}_endereco_entrega_pais" name="endereco_entrega_pais_cliente" class="input-xlarge">
                                                                    <textarea id="form_${item.id}_endereco_entrega_observacao" name="endereco_entrega_observacao_cliente" class="input-xlarge hidden"></textarea>
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_frase_curta" name="endereco_cobranca_frase_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_tipo_residencia" name="endereco_cobranca_tipo_residencia_cliente">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_cep" name="endereco_cobranca_cep_cliente" class="input-small">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_tipo_logradouro" name="endereco_cobranca_tipo_logradouro_cliente">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_logradouro" name="endereco_cobranca_logradouro_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_numero" name="endereco_cobranca_numero_cliente" class="input-mini">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_bairro" name="endereco_cobranca_bairro_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_cidade" name="endereco_cobranca_cidade_cliente" class="input-xlarge">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_estado" name="endereco_cobranca_estado_cliente" class="input-mini">
                                                                    <input type="hidden" id="form_${item.id}_endereco_cobranca_pais" name="endereco_cobranca_pais_cliente" class="input-xlarge">
                                                                    <textarea id="form_${item.id}_endereco_cobranca_observacao" name="endereco_cobranca_observacao_cliente" class="input-xlarge hidden"></textarea>
                                                                </form>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Cadastrar Novo Cliente" onclick="editHandler()"></div>
                            </div>
                        </section>
                        <section class="hidden" id="editar_cadastro_cliente">
                            <div class="row">
                                <div class="span12">
                                    <section id="pedidos_cliente">
                                        <h4 class="title"><span class="text"><strong>Pedidos</strong> Cliente</span></h4>
                                        <div class="js-container-pedidos-cliente js-liberar-edicao">
                                            <form action="AlterarSituacaoPedido" id="formAlterarSituacaoPedido" method="POST">
                                                <input type="hidden" name="pedido_id" id="formAlterarSituacaoPedido_pedido_id">
                                                <input type="hidden" name="situacao_pedido" id="formAlterarSituacaoPedido_pedido_situacao">
                                            </form>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Cód. Pedido</th>
                                                        <th>Cód. Cliente</th>
                                                        <th>Data Pedido</th>
                                                        <th>Valor Final</th>
                                                        <th>Última atualização</th>
                                                        <th>Situação</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                    </section>
                                    <section class="cadastro_cliente js-liberar-edicao">
                                        <form id="formAlterarCadastroParcial" action="AlterarClienteParcial" method="POST">
                                            <input type="hidden" id="formAlterarCadastroParcial_id" name="id_cliente" class="input-xlarge">
                                            <input type="hidden" name="operacao" value="ALTERAR">
                                            <h4 class="title"><span class="text"><strong>Cadastro</strong> Cliente</span></h4>
                                            <div class="span12">
                                                <div class="span5 col">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <label class="control-label">Usuário*:</label>
                                                            <div class="controls">
                                                                <input readonly type="text" placeholder="Digite seu usuário" id="formAlterarCadastroParcial_usuario" name="usuario_cliente" class="input-xlarge">
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Senha*:</label>
                                                            <div class="controls">
                                                                <input readonly type="password" placeholder="Digite sua senha" id="formAlterarCadastroParcial_senha" name="senha_cliente" class="input-xlarge">
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="span5 col">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <label class="control-label">Nome completo*:</label>
                                                            <div class="controls">
                                                                <input readonly type="text" placeholder="Digite o nome completo" id="formAlterarCadastroParcial_nome_completo" name="nome_cliente" class="input-xlarge">
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Data de nascimento*:</label>
                                                            <div class="controls">
                                                                <input readonly type="date" id="formAlterarCadastroParcial_data_nascimento" name="data_nascimento_cliente" class="input-xlarge">
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Gênero*:</label>
                                                            <select readonly class="controls" id="formAlterarCadastroParcial_genero" name="genero_cliente">
                                                        <option value="feminino">Feminino</option>
                                                        <option value="masculino">Masculino</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">CPF*:</label>
                                                            <div class="controls">
                                                                <input readonly type="text" placeholder="Digite seu cpf" id="formAlterarCadastroParcial_cpf" name="cpf_cliente" class="input-xlarge">
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Email*:</label>
                                                            <div class="controls">
                                                                <input readonly type="email" placeholder="Digite seu email" id="formAlterarCadastroParcial_email" name="email_cliente" class="input-xlarge">
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Telefone*:</label>
                                                            <div class="controls">
                                                                <input readonly type="tel" placeholder="XX" id="formAlterarCadastroParcial_telefone_ddd" name="telefone_ddd_cliente" class="input-mini">
                                                                <input readonly type="tel" placeholder="XXXXX-XXXX" id="formAlterarCadastroParcial_telefone_numero" name="telefone_numero_cliente" class="input-small">
                                                                <select readonly class="controls" id="formAlterarCadastroParcial_telefone_tipo" name="telefone_tipo_cliente">
                                                            <option value="residencial">Residencial</option>
                                                            <option value="celular">Celular</option>
                                                            <option value="comercial">Comercial</option>
                                                        </select>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <button class="btn btn-warning btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="center" title="Editar" onclick="liberarEdicaoAccordion(this)">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                </svg>
                                            </button>
                                                <div class="actions span3" style="float: right"><input id="btn_alterar_cadastro" form="formAlterarCadastroParcial" class="btn btn-inverse large hidden" type="submit" value="ALTERAR"></div>
                                            </div>
                                        </form>
                                    </section>
                                    <section id="enderecos_entrega">
                                        <h4 class="title"><span class="text"><strong>Endereços</strong> Entrega</span></h4>
                                        <div class="js-container-enderecos-entrega"></div>
                                    </section>
                                    <section class="cadastrar_novo_endereco_entrega">
                                        <button>
                                        <a class="accordion-toggle" data-toggle="collapse" href="#cadastrar_novo_endereco_entrega">
                                            <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                                        </a>
                                    </button>
                                        <div id="cadastrar_novo_endereco_entrega" class="accordion-body collapse js-liberar-edicao">
                                            <form id="formCadastrarNovoEnderecoEntrega" action="CadastrarEndereco" method="POST">
                                                <input type="hidden" name="endereco_tipo" value="ENTREGA">
                                                <input type="hidden" name="endereco_entrega_cliente_id">
                                                <div class="accordion-inner">
                                                    <div class="row-fluid">
                                                        <div class="span5 col">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label">Frase curta para nomear endereço*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_frase_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Tipo de residência*:</label>
                                                                    <select class="form-control-plaintext" name="endereco_entrega_tipo_residencia_cliente">
                                                                    <option value="casa">Casa</option>
                                                                    <option value="apartamento">Apartamento</option>
                                                                    <option value="outro">Outro</option>
                                                                </select>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">CEP*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_cep_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Tipo de logradouro*:</label>
                                                                    <select class="form-control-plaintext" name="endereco_entrega_tipo_logradouro_cliente">
                                                                    <option value="rua">Rua</option>
                                                                    <option value="avenida">Avenida</option>
                                                                    <option value="travessa">Travessa</option>
                                                                    <option value="viela">Viela</option>
                                                                    <option value="rodovia">Rodovia</option>
                                                                    <option value="outro">Outro</option>
                                                                </select>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Logradouro*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_logradouro_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Número*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_numero_cliente">
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <div class="span1 col"></div>
                                                        <div class="span5 col">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label">Bairro*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_bairro_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Cidade*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_cidade_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Estado*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_estado_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">País*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_entrega_pais_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Observação:</label>
                                                                    <div class="controls">
                                                                        <textarea class="form-control-plaintext" name="endereco_entrega_observacao_cliente"></textarea>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <div class="actions span3" style="float: right"><input tabindex="9" form="formCadastrarNovoEnderecoEntrega" class="btn btn-inverse large" type="submit" name="operacao" value="SALVAR"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </section>
                                    <br>
                                    <section id="enderecos_cobranca">
                                        <h4 class="title"><span class="text"><strong>Endereços</strong> cobrança</span></h4>
                                        <div class="js-container-enderecos-cobranca"></div>
                                    </section>
                                    <section class="cadastrar_novo_endereco_cobranca">
                                        <button>
                                        <a class="accordion-toggle" data-toggle="collapse" href="#cadastrar_novo_endereco_cobranca">
                                            <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                                        </a>
                                    </button>
                                        <div id="cadastrar_novo_endereco_cobranca" class="accordion-body collapse js-liberar-edicao">
                                            <form id="formCadastrarNovoEnderecoCobranca" action="CadastrarEndereco" method="POST">
                                                <input type="hidden" name="endereco_tipo" value="COBRANCA">
                                                <input type="hidden" name="endereco_cobranca_cliente_id">
                                                <div class="accordion-inner">
                                                    <div class="row-fluid">
                                                        <div class="span5 col">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label">Frase curta para nomear endereço*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_frase_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Tipo de residência*:</label>
                                                                    <select class="form-control-plaintext" name="endereco_cobranca_tipo_residencia_cliente">
                                                                    <option value="casa">Casa</option>
                                                                    <option value="apartamento">Apartamento</option>
                                                                    <option value="outro">Outro</option>
                                                                </select>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">CEP*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_cep_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Tipo de logradouro*:</label>
                                                                    <select class="form-control-plaintext" name="endereco_cobranca_tipo_logradouro_cliente">
                                                                    <option value="rua">Rua</option>
                                                                    <option value="avenida">Avenida</option>
                                                                    <option value="travessa">Travessa</option>
                                                                    <option value="viela">Viela</option>
                                                                    <option value="rodovia">Rodovia</option>
                                                                    <option value="outro">Outro</option>
                                                                </select>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Logradouro*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_logradouro_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Número*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_numero_cliente">
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <div class="span1 col"></div>
                                                        <div class="span5 col">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label">Bairro*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_bairro_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Cidade*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_cidade_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Estado*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_estado_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">País*:</label>
                                                                    <div class="controls">
                                                                        <input type="text" class="form-control-plaintext" name="endereco_cobranca_pais_cliente">
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Observação:</label>
                                                                    <div class="controls">
                                                                        <textarea class="form-control-plaintext" name="endereco_cobranca_observacao_cliente"></textarea>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <div class="actions span3" style="float: right"><input tabindex="9" form="formCadastrarNovoEnderecoCobranca" class="btn btn-inverse large" type="submit" name="operacao" value="SALVAR"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </section>
                                    <br>
                                    <section class="cupons_cliente">
                                        <h4 class="title"><span class="text"><strong>Cupons</strong> Cadastrados</span></h4>
                                        <div class="js-container-cupons-cliente">
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Cód. Cupom</th>
                                                        <th>Valor</th>
                                                        <th>Tipo</th>
                                                        <th>Válido</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                    </section>
                                    <section class="hidden" id="editar_status_cliente">
                                        <div class="row">
                                            <form action="#" method="post">
                                                <div class="span12">
                                                    <h4 class="title"><span class="text"><strong>Ativar/Inativar</strong> Cliente</span></h4>
                                                    <div class="control-group">
                                                        <label class="control-label">Código Único:</label>
                                                        <div class="controls">
                                                            <input type="text" id="codigo_produto" class="input-small" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Selecione o Status desejado*:</label>
                                                        <select class="controls" id="status_produto">
                                            <option value="ativo">Ativo</option>
                                            <option value="inativo">Inativo</option>
                                        </select>
                                                    </div>
                                                    <div class="hidden control-group">
                                                        <label class="control-label">Selecione a categoria desejada*:</label>
                                                        <select class="controls" id="categoria_status_produto">
                                            <option value="dados_incorretos">DADOS INCORRETOS</option>
                                            <option value="outro">OUTRO</option>
                                        </select>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Justificativa*:</label>
                                                        <div class="controls">
                                                            <textarea id="justificativa_produto" placeholder="Justificativa obrigatória" class="input-xlarge"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Editar status Cliente"></div>
                                            </form>
                                        </div>
                                    </section>
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
                        const json_clientes = JSON.parse('${clientes}');
                        const container_enderecos_entrega = document.querySelector('.js-container-enderecos-entrega');
                        const container_enderecos_cobranca = document.querySelector('.js-container-enderecos-cobranca');
                        const container_pedidos_cliente = document.querySelector('.js-container-pedidos-cliente table tbody');
                        const container_cupons_cliente = document.querySelector('.js-container-cupons-cliente table tbody');
                        const formAlterarSituacaoPedido = document.querySelector('#formAlterarSituacaoPedido');
                        const cliente_id_inputs = document.querySelectorAll('input[name*="cliente_id"]');

                        const liberarEdicaoAccordion = (button) => {
                            let inputs = button.closest('.js-liberar-edicao').querySelectorAll('input, select, textarea');
                            inputs.forEach(input => {
                                if (input.type == "submit")
                                    input.classList.toggle('hidden')
                                else input.toggleAttribute('readonly');
                            });
                        }

                        const liberarEdicaoStatusPedido = (button) => {
                            let inputs = button.closest('.js-liberar-edicao').querySelectorAll('input, select, textarea');
                            inputs.forEach(input => {
                                if (input.type == "submit")
                                    input.classList.toggle('hidden')
                                else if (input.tagName == "SELECT")
                                    input.toggleAttribute('disabled');
                                else input.toggleAttribute('readonly');
                            });
                        }

                        const alteraFormSituacaoPedido = (select) => {
                            formAlterarSituacaoPedido.firstElementChild.setAttribute('value', select.id.split('_')[1]);
                            formAlterarSituacaoPedido.lastElementChild.setAttribute('value', select.value);
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

                        const preenchePedidos = (dados_cliente) => {
                            container_pedidos_cliente.innerHTML = '';

                            dados_cliente.pedido.forEach(ped => {
                                let linha_pedido = new LinhaPedido(ped).criaLinhaPedido();
                                container_pedidos_cliente.insertAdjacentHTML('beforeend', linha_pedido);
                            })

                            document.querySelectorAll('select[name="situacao_pedido"]').forEach((sel, index) => {
                                sel.value = sel.getAttribute('value');
                            });
                        }

                        const preencheCupons = (dados_cliente) => {
                            container_cupons_cliente.innerHTML = '';

                            dados_cliente.cupom.forEach(cup => {
                                let linha_cupom = new LinhaCupom(cup).criaLinhaCupom();
                                container_cupons_cliente.insertAdjacentHTML('beforeend', linha_cupom);
                            })
                        }

                        const editHandler = (botao, cli_id) => {
                            formStatus.classList.toggle('hidden', true);
                            formAlteracao.classList.toggle('hidden', false);

                            let dados_cliente = json_clientes.filter((value) =>
                                value.id == cli_id
                            )[0];

                            cliente_id_inputs.forEach(input => input.value = cli_id);

                            preencheEnderecos(dados_cliente);
                            preenchePedidos(dados_cliente);
                            preencheCupons(dados_cliente);
                            buttonHandler(botao);
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

                        const getValor = (item) => {
                            console.log(item);
                        }
                    </script>

                </body>

                </html>
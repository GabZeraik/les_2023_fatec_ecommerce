<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

            <head>
                <meta charset="utf-8">
                <title>Projeto LES 2023 - E-Commerce</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="">
                <!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
                <!-- bootstrap -->
                <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
                <link href="static/themes/css/bootstrappage.css" rel="stylesheet" />

                <!-- global styles -->
                <link href="static/themes/css/flexslider.css" rel="stylesheet" />
                <link href="static/themes/css/main.css" rel="stylesheet" />

                <!-- scripts -->
                <script src="static/themes/js/jquery-1.7.2.min.js"></script>
                <script src="static/bootstrap/js/bootstrap.min.js"></script>
                <script src="static/themes/js/superfish.js"></script>
                <script src="static/themes/js/jquery.scrolltotop.js"></script>
                <!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
            </head>

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
                                    <li>Status<input type="text" name="situacao_cliente" class="input-block-level search-query"></li>
                                    <li>Código<input type="text" name="codigo_cliente" class="input-block-level search-query"></li>
                                    <li>Nome completo<input type="text" name="nome_cliente" class="input-block-level search-query"></li>
                                    <li>Data de nascimento<input type="text" name="data_nascimento_cliente" class="input-block-level search-query"></li>
                                    <li>Gênero<input type="text" name="genero_cliente" class="input-block-level search-query"></li>
                                    <li>CPF<input type="text" name="cpf_cliente" class="input-block-level search-query"></li>
                                    <li>Email<input type="text" name="email_cliente" class="input-block-level search-query"></li>
                                    <li>Telefone<input type="text" name="telefone_ddd_cliente" class="input-block-level search-query"></li>
                                    <li>Ranking<input type="text" name="ranking_cliente" class="input-block-level search-query"></li>
                                </ul>
                                <div class="actions" style="float: right"><input class="btn btn-inverse large" form="formConsultarCliente" type="submit" name="operacao" value="CONSULTAR"></div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="wrapper" class="container">
                    <section class="main-content">
                        <div class="row">
                            <div class="span12">
                                <h4 class="title"><span class="text"><strong>ADMINISTRAÇÃO</strong> Clientes</span></h4>
                                <table class="table table-striped table-hover">
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
                                            <th>Endereços</th>
                                            <th>Ranking</th>
                                            <th>Cat. Status/Justificativa</th>
                                            <th colspan="3"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${clientes != null && clientes.operacao == 'CONSULTAR'}">
                                                <c:choose>
                                                    <c:when test="${clientes.dados.size() > 0}">
                                                        <c:forEach items="${clientes.dados}" var="item">
                                                            <tr>
                                                                <td>${item.situacao}</td>
                                                                <td>${item.usuario}</td>
                                                                <td>${item.nome}</td>
                                                                <td>${item.dta_nascimento}</td>
                                                                <td>${item.genero}</td>
                                                                <td>${item.cpf}</td>
                                                                <td>${item.email}</td>
                                                                <td>(${item.telefone.ddd})${item.telefone.numero} - ${item.telefone.tipo}</td>
                                                                <td>
                                                                    <c:forEach items="${item.endereco}" var="item_endereco">
                                                                        <div class="modal fade" id="modal_end_id_${item_endereco.id}" tabindex="-1" role="dialog" aria-labelledby="modal_end_id_${item_endereco.id}" aria-hidden="true">
                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title" id="modal_end_id_${item_endereco.id}_titulo">Endereço: ${item_endereco.frase}</h5>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <table class="table table-striped table-hover">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th>Tipo</th>
                                                                                                    <th>CEP</th>
                                                                                                    <th>Residência</th>
                                                                                                    <th>Logradouro</th>
                                                                                                    <th>Tipo Logradouro</th>
                                                                                                    <th>Número</th>
                                                                                                    <th>Bairro</th>
                                                                                                    <th>Cidade</th>
                                                                                                    <th>Estado</th>
                                                                                                    <th>País</th>
                                                                                                    <th>Observação</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td>${item_endereco.tipo}</td>
                                                                                                    <td>${item_endereco.cep}</td>
                                                                                                    <td>${item_endereco.residencia}</td>
                                                                                                    <td>${item_endereco.logradouro}</td>
                                                                                                    <td>${item_endereco.tipo_logradouro}</td>
                                                                                                    <td>${item_endereco.numero}</td>
                                                                                                    <td>${item_endereco.bairro}</td>
                                                                                                    <td>${item_endereco.cidade.nome_cidade}</td>
                                                                                                    <td>${item_endereco.cidade.estado.nome_estado}</td>
                                                                                                    <td>${item_endereco.cidade.estado.pais.nome_pais}</td>
                                                                                                    <td>${item_endereco.observacao}</td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <button class="btn btn-secondary" data-target="#modal_end_id_${item_endereco.id}" data-toggle="modal">${item_endereco.frase}</button><br>
                                                                    </c:forEach>
                                                                </td>
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
                                <section class="pedidos_cliente">
                                    <form action="#" method="post">
                                        <h4 class="title"><span class="text"><strong>Pedidos</strong> Cliente</span></h4>
                                        <table class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Cód. Pedido</th>
                                                    <th>Valor</th>
                                                    <th>Data</th>
                                                    <th>Situação</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <form action="/action_page.php" method="post">
                                                    <tr>
                                                        <td>
                                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#item_1">
                                                                <span class="text"><strong>122</strong></span>
                                                            </a>
                                                            <div id="item_1" class="accordion-body collapse">
                                                                <div class="accordion-inner">
                                                                    <div class="row-fluid">
                                                                        <h5 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h5>
                                                                        <table class="table table-striped table-hover" style="background-color: transparent;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th>Produto</th>
                                                                                    <th>Quantidade</th>
                                                                                    <th>Preço Unitário</th>
                                                                                    <th>Total</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Fusce id molestie massa</td>
                                                                                    <td><input type="text" value="1" class="input-mini" readonly></td>
                                                                                    <td>R$2.350,00</td>
                                                                                    <td>R$2.350,00</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                                    <td><input type="text" value="2" class="input-mini" readonly></td>
                                                                                    <td>R$1.150,00</td>
                                                                                    <td>R$2.450,00</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Wuam ultrices rutrum</td>
                                                                                    <td><input type="text" value="1" class="input-mini" readonly></td>
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
                                                                        <div class="hidden actions" style="float: left" id="btn_cadastrar_cartao">
                                                                            <p>Para solicitar troca ou devolução, selecione o item e digite a quantidade a ser trocada/devolvida</p><input tabindex="9" class="btn btn-inverse large" type="submit" value="Solicitar troca/devolução"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>R$350,00</td>
                                                        <td>27/02/2023</td>
                                                        <td>EM PROCESSAMENTO</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#item_2">
                                                                <span class="text"><strong>105</strong></span>
                                                            </a>
                                                            <div id="item_2" class="accordion-body collapse">
                                                                <div class="accordion-inner">
                                                                    <div class="row-fluid">
                                                                        <h6 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h6>
                                                                        <table class="table table-striped table-hover" style="background-color: transparent;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th>Produto</th>
                                                                                    <th>Quantidade</th>
                                                                                    <th>Preço Unitário</th>
                                                                                    <th>Total</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Fusce id molestie massa</td>
                                                                                    <td><input type="text" value="1" class="input-mini"></td>
                                                                                    <td>R$2.350,00</td>
                                                                                    <td>R$2.350,00</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                                    <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                                    <td>R$1.150,00</td>
                                                                                    <td>R$2.450,00</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
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
                                                                        <div class="hidden actions" style="float: left" id="btn_cadastrar_cartao">
                                                                            <p>Para solicitar troca ou devolução, selecione o item e digite confirme a quantidade a ser trocada/devolvida</p><input tabindex="9" class="btn btn-inverse large" type="submit" value="Solicitar troca/devolução"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>R$350,00</td>
                                                        <td>27/02/2023</td>
                                                        <td>EM TRÂNSITO</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#item_3">
                                                                <span class="text"><strong>98</strong></span>
                                                            </a>
                                                            <div id="item_3" class="accordion-body collapse">
                                                                <div class="accordion-inner">
                                                                    <div class="row-fluid">
                                                                        <h6 class="title"><span class="text"><strong>Resumo</strong> da compra</span></h6>
                                                                        <table class="table table-striped table-hover" style="background-color: transparent;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th>Produto</th>
                                                                                    <th>Quantidade</th>
                                                                                    <th>Preço Unitário</th>
                                                                                    <th>Total</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Fusce id molestie massa</td>
                                                                                    <td><input type="text" value="1" class="input-mini"></td>
                                                                                    <td>R$2.350,00</td>
                                                                                    <td>R$2.350,00</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                                    <td>
                                                                                        <a href="product_detail.jsp"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                                    </td>
                                                                                    <td>Luctus quam ultrices rutrum</td>
                                                                                    <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                                    <td>R$1.150,00</td>
                                                                                    <td>R$2.450,00</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
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
                                                                        <div class="actions" style="float: left" id="btn_cadastrar_cartao">
                                                                            <p>Para solicitar troca ou devolução, selecione o item e digite confirme a quantidade a ser trocada/devolvida</p><input tabindex="9" class="btn btn-inverse large" type="submit" value="Solicitar troca/devolução"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>R$350,00</td>
                                                        <td>27/02/2022</td>
                                                        <td>ENTREGUE</td>
                                                    </tr>
                                                </form>
                                            </tbody>
                                        </table>
                                    </form>
                                </section>
                                <section class="cadastro_cliente">
                                    <form id="formAlterarCadastroParcial" action="AlterarClienteParcial" method="POST">
                                        <input type="hidden" id="formAlterarCadastroParcial_id" name="id_cliente" class="input-xlarge">
                                        <h4 class="title"><span class="text"><strong>Cadastro</strong> Cliente</span></h4>
                                        <div class="span1 col"></div>
                                        <div class="span12 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Usuário*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite seu usuário" id="formAlterarCadastroParcial_usuario" name="usuario_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Senha*:</label>
                                                    <div class="controls">
                                                        <input type="password" placeholder="Digite sua senha" id="formAlterarCadastroParcial_senha" name="senha_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <hr>
                                        </div>
                                        <div class="span5 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Nome completo*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite o nome completo" id="formAlterarCadastroParcial_nome_completo" name="nome_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Data de nascimento*:</label>
                                                    <div class="controls">
                                                        <input type="date" id="formAlterarCadastroParcial_data_nascimento" name="data_nascimento_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Gênero*:</label>
                                                    <select class="controls" id="formAlterarCadastroParcial_genero" name="genero_cliente">
                                                        <option value="feminino">Feminino</option>
                                                        <option value="masculino">Masculino</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">CPF*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite seu cpf" id="formAlterarCadastroParcial_cpf" name="cpf_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="span1 col"></div>
                                        <div class="span5 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Email*:</label>
                                                    <div class="controls">
                                                        <input type="email" placeholder="Digite seu email" id="formAlterarCadastroParcial_email" name="email_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Telefone*:</label>
                                                    <div class="controls">
                                                        <input type="tel" placeholder="XX" id="formAlterarCadastroParcial_telefone_ddd" name="telefone_ddd_cliente" class="input-mini">
                                                        <input type="tel" placeholder="XXXXX-XXXX" id="formAlterarCadastroParcial_telefone_numero" name="telefone_numero_cliente" class="input-small">
                                                        <select class="controls" id="formAlterarCadastroParcial_telefone_tipo" name="telefone_tipo_cliente">
                                                            <option value="residencial">Residencial</option>
                                                            <option value="celular">Celular</option>
                                                            <option value="comercial">Comercial</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="actions span3" style="float: right" id="btn_cadastrar_cartao"><input tabindex="9" form="formAlterarCadastroParcial" class="btn btn-inverse large" type="submit" name="operacao" value="ALTERAR"></div>
                                        </div>
                                    </form>
                                </section>
                                <section class="enderecos_cadastrados">
                                    <div class="span12">
                                        <h4 class="title"><span class="text"><strong>Endereços</strong> Entrega</span></h4>
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#endereco_1">
                                            <h4><span class="text"><strong>Frase endereço</strong></span></h4>
                                        </a>
                                        <div id="endereco_1" class="accordion-body collapse">
                                            <div class="accordion-inner">
                                                <div class="row-fluid">
                                                    <div class="span5 col">
                                                        <fieldset>
                                                            <div class="control-group">
                                                                <label class="control-label">Frase curta para nomear endereço*:</label>
                                                                <div class="controls">
                                                                    <input value="Frase" type="text" readonly class="form-control-plaintext" id="endereco_entrega_frase_curta" name="endereco_entrega_frase_cliente">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Tipo de residência*:</label>
                                                                <select value="casa" readonly class="form-control-plaintext" id="endereco_entrega_tipo_residencia">
                                                                    <option value="casa">Casa</option>
                                                                    <option value="apartamento">Apartamento</option>
                                                                    <option value="outro">Outro</option>
                                                                </select>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">CEP*:</label>
                                                                <div class="controls">
                                                                    <input value="cep" type="text" id="endereco_entrega_cep" readonly class="form-control-plaintext">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Tipo de logradouro*:</label>
                                                                <select value="avenida" readonly class="form-control-plaintext" id="endereco_entrega_tipo_logradouro">
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
                                                                    <input value="logradouro" type="text" id="endereco_entrega_logradouro" readonly class="form-control-plaintext">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Número*:</label>
                                                                <div class="controls">
                                                                    <input value="numero" type="text" id="endereco_entrega_numero" readonly class="form-control-plaintext">
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
                                                                    <input value="bairro" type="text" id="endereco_entrega_bairro" readonly class="form-control-plaintext">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Cidade*:</label>
                                                                <div class="controls">
                                                                    <input value="cidade" type="text" id="endereco_entrega_cidade" readonly class="form-control-plaintext">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Estado*:</label>
                                                                <div class="controls">
                                                                    <input value="estado" type="text" id="endereco_entrega_estado" readonly class="form-control-plaintext">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">País*:</label>
                                                                <div class="controls">
                                                                    <input value="pais" type="text" id="endereco_entrega_pais" readonly class="form-control-plaintext">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Observação:</label>
                                                                <div class="controls">
                                                                    <textarea value="observacao" id="endereco_entrega_observacao" readonly class="form-control-plaintext"></textarea>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                    <button class="btn btn-warning btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="center" title="Editar">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                        </svg>
                                                    </button>
                                                </div>
                                                <div class="actions span3" style="float: right" id="btn_alterar_endereco_1"><input tabindex="9" form="" class="btn btn-inverse large" type="submit" name="operacao" value="ALTERAR"></div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <hr>
                        <section class="cadastrar_novo_endereco">
                            <div class="span12">
                                <button>
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#cadastrar_novo_endereco">
                                <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                            </a>
                        </button>
                                <div id="cadastrar_novo_endereco" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="row-fluid">
                                            <div class="span5 col">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label">Frase curta para nomear endereço*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de residência*:</label>
                                                        <select class="controls" id="endereco_entrega_tipo_residencia">
                                                            <option value="casa">Casa</option>
                                                            <option value="apartamento">Apartamento</option>
                                                            <option value="outro">Outro</option>
                                                        </select>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">CEP*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_cep" class="input-small">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de logradouro*:</label>
                                                        <select class="controls" id="endereco_entrega_tipo_logradouro">
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
                                                            <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Número*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_numero" class="input-mini">
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
                                                            <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Cidade*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Estado*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">País*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Observação:</label>
                                                        <div class="controls">
                                                            <textarea id="endereco_entrega_observacao" placeholder="Opcional" class="input-xlarge"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="actions" style="float: left" id="btn_cadastrar_cartao"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Cadastrar"></div>
                                </div>
                                <hr>
                            </div>
                        </section>
                        <section class="enderecos_cliente">
                            <div class="span12">
                                <h4 class="title"><span class="text"><strong>Endereços</strong> Cobrança</span></h4>
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#endereco_cobranca_1">
                                    <h4><span class="text"><strong>Endereço</strong> 1</span></h4>
                                </a>
                                <div id="endereco_cobranca_1" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="row-fluid">
                                            <div class="span5 col">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label">Frase curta para nomear endereço*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de residência*:</label>
                                                        <select class="controls" id="endereco_entrega_tipo_residencia">
                                                            <option value="casa">Casa</option>
                                                            <option value="apartamento">Apartamento</option>
                                                            <option value="outro">Outro</option>
                                                        </select>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">CEP*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_cep" class="input-small">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de logradouro*:</label>
                                                        <select class="controls" id="endereco_entrega_tipo_logradouro">
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
                                                            <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Número*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_numero" class="input-mini">
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
                                                            <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Cidade*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Estado*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">País*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Observação:</label>
                                                        <div class="controls">
                                                            <textarea id="endereco_entrega_observacao" placeholder="Opcional" class="input-xlarge"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="actions" style="float: left" id="btn_cadastrar_cartao"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Editar"></div>
                                </div>
                                <hr>
                            </div>
                        </section>
                        <section class="cadastrar_novo_endereco_cobranca">
                            <div class="span12">
                                <button><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#cadastrar_novo_endereco_cobranca">
                                    <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                                </a></button>
                                <div id="cadastrar_novo_endereco_cobranca" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="row-fluid">
                                            <div class="span5 col">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label">Frase curta para nomear endereço*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de residência*:</label>
                                                        <select class="controls" id="endereco_entrega_tipo_residencia">
                                                            <option value="casa">Casa</option>
                                                            <option value="apartamento">Apartamento</option>
                                                            <option value="outro">Outro</option>
                                                        </select>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">CEP*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_cep" class="input-small">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de logradouro*:</label>
                                                        <select class="controls" id="endereco_entrega_tipo_logradouro">
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
                                                            <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Número*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_numero" class="input-mini">
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
                                                            <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Cidade*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Estado*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">País*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Observação:</label>
                                                        <div class="controls">
                                                            <textarea id="endereco_entrega_observacao" placeholder="Opcional" class="input-xlarge"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="actions" style="float: left" id="btn_cadastrar_cartao"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Cadastrar"></div>
                                </div>
                                <hr>
                            </div>
                        </section>
                        <section class="cupons_cliente">
                            <h4 class="title"><span class="text"><strong>Cupons</strong> Cadastrados</span></h4>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Cód. Cupom</th>
                                        <th>Valor</th>
                                        <th>Tipo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>123456</td>
                                        <td>R$350,00</td>
                                        <td>Troca</td>
                                    </tr>
                                    <tr>
                                        <td>124588</td>
                                        <td>R$350,00</td>
                                        <td>Promocional</td>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                </div>
                </form>
                </div>
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
                <section id="footer-bar">
                    <div class="row">
                        <div class="span3">
                            <h4>Navegação</h4>
                            <ul class="nav">
                                <li><a href="./index.jsp">HOME</a></li>
                                <li><a href="./about.jsp">Sobre</a></li>
                                <li><a href="./contact.jsp">Contato</a></li>
                                <li><a href="./cart.jsp">Carrinho</a></li>
                                <li><a href="./login.jsp">Entrar</a></li>
                            </ul>
                        </div>
                        <div class="span4">
                            <h4>Minha conta</h4>
                            <ul class="nav">
                                <li><a href="#">Minha conta</a></li>
                                <li><a href="#">Histórico de pedidos</a></li>
                                <li><a href="#">Lista de desejos</a></li>
                                <li><a href="#">Newsletter</a></li>
                            </ul>
                        </div>
                        <div class="span5">
                            <p class="logo"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></p>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
                            <br/>
                            <span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
                        </div>
                    </div>
                </section>
                <section id="copyright">
                    <span>Copyright 2013 bootstrappage template  All right reserved.</span>
                </section>
                </div>
                <script type="text/javascript">
                    const formAlteracao = document.querySelector('#editar_cadastro_cliente');
                    const formStatus = document.querySelector('#editar_status_cliente');
                    const json_resultado = JSON.parse('${clientes}');

                    document.querySelectorAll('button[title="Editar"]').forEach(element => {
                        element.addEventListener('click', (el) => {
                            let section_id = "#" + el.closest('section').id;
                            document.querySelectorAll(section_id + " input").forEach(input => input.removeAttribute('readonly'));
                        })
                    });

                    const editHandler = (botao, cli_id) => {
                        formStatus.classList.toggle('hidden', true);
                        formAlteracao.classList.toggle('hidden', false);

                        let dados_cliente = json_resultado.dados.filter((value) =>
                            value.id == cli_id
                        )[0];

                        console.log(dados_cliente);
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
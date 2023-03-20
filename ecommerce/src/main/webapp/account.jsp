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
                        <div class="span4">
                            <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                            <form method="POST" class="search_form">
                                <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                            </form>
                        </div>
                        <c:if test="${usuario_logado != null}">
                            <div class="span3">
                                <span>Bem vindo ${usuario_logado.nome}</span>
                            </div>
                        </c:if>
                        <div class="span8">
                            <div class="account pull-right">
                                <ul class="user-menu">
                                    <li><a href="#">Minha conta</a></li>
                                    <li><a href="cart.jsp">Carrinho</a></li>
                                    <li><a href="checkout.jsp">Finalizar Compra</a></li>
                                    <li><a href="login.jsp">Entrar</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="wrapper" class="container">
                    <section class="navbar main-menu">
                        <div class="navbar-inner main-menu">
                            <nav id="menu" class="pull-right">
                                <ul>
                                    <li><a href="./products.jsp">Mulher</a>
                                        <ul>
                                            <li><a href="./products.jsp">Presentes</a></li>
                                            <li><a href="./products.jsp">Acessórios</a></li>
                                            <li><a href="./products.jsp">Inverno</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./products.jsp">Homem</a>
                                        <ul>
                                            <li><a href="./products.jsp">Presentes</a></li>
                                            <li><a href="./products.jsp">Acessórios</a></li>
                                            <li><a href="./products.jsp">Inverno</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./products.jsp">Melhor avaliados</a></li>
                                    <li><a href="./products.jsp">Mais vendidos</a></li>
                                </ul>
                            </nav>
                        </div>
                    </section>
                    <section class="header_text sub">
                        <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="New products">
                    </section>
                    <section id="editar_cadastro_cliente">
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
                                                                        <div class="hidden actions" style="float: left">
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
                                                                        <div class="hidden actions" style="float: left">
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
                                                                        <div class="actions" style="float: left">
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
                    <section id="meus_cartoes">
                        <h4 class="title"><span class="text"><strong>Meus</strong> Cartões</span></h4>
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
                        </label>

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
                            </div>
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
                <script src="static/js/crud_cliente.js"></script>
                <script type="text/javascript">
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
                        console.log(dados_cliente);
                        dados_cliente.endereco.forEach(end => {
                            let linha_endereco = new LinhaEndereco(end).criaLinhaEndereco();
                            if (end.tipo == "ENTREGA") {
                                container_enderecos_entrega.insertAdjacentHTML('beforeend', linha_endereco);
                            } else container_enderecos_cobranca.insertAdjacentHTML('beforeend', linha_endereco);
                        })
                    }

                    const editHandler = (botao, cli_id) => {
                        formStatus.classList.toggle('hidden', true);
                        formAlteracao.classList.toggle('hidden', false);

                        cliente_id_inputs.forEach(input => input.value = json_resultado.id);

                        preencheEnderecos(json_resultado);
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
                </script>
            </body>

            </html>
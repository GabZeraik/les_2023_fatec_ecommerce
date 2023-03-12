<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <html lang="en">

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
                        <a href="index.html" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                        <form method="POST" class="search_form">
                            <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                        </form>
                    </div>
                    <div class="span8">
                        <div class="account pull-right">
                            <ul class="user-menu">
                                <li><a href="#">Minha conta</a></li>
                                <li><a href="cart.html">Carrinho</a></li>
                                <li><a href="checkout.html">Finalizar Compra</a></li>
                                <li><a href="login.html">Entrar</a></li>
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
                                <li><a href="./products.html">Mulher</a>
                                    <ul>
                                        <li><a href="./products.html">Presentes</a></li>
                                        <li><a href="./products.html">Acessórios</a></li>
                                        <li><a href="./products.html">Inverno</a></li>
                                    </ul>
                                </li>
                                <li><a href="./products.html">Homem</a>
                                    <ul>
                                        <li><a href="./products.html">Presentes</a></li>
                                        <li><a href="./products.html">Acessórios</a></li>
                                        <li><a href="./products.html">Inverno</a></li>
                                    </ul>
                                </li>
                                <li><a href="./products.html">Melhor avaliados</a></li>
                                <li><a href="./products.html">Mais vendidos</a></li>
                            </ul>
                        </nav>
                    </div>
                </section>
                <section class="header_text sub">
                    <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="New products">
                </section>
                <section class="main-content">
                    <div class="row">
                        <div class="span12">
                            <section class="meus_pedidos">
                                <h4 class="title"><span class="text"><strong>Meus</strong> Pedidos</span></h4>
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
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                            </td>
                                                                            <td>Fusce id molestie massa</td>
                                                                            <td><input type="text" value="1" class="input-mini" readonly></td>
                                                                            <td>R$2.350,00</td>
                                                                            <td>R$2.350,00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                            <td>
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                            </td>
                                                                            <td>Luctus quam ultrices rutrum</td>
                                                                            <td><input type="text" value="2" class="input-mini" readonly></td>
                                                                            <td>R$1.150,00</td>
                                                                            <td>R$2.450,00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                            <td>
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
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
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                            </td>
                                                                            <td>Fusce id molestie massa</td>
                                                                            <td><input type="text" value="1" class="input-mini"></td>
                                                                            <td>R$2.350,00</td>
                                                                            <td>R$2.350,00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                            <td>
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                            </td>
                                                                            <td>Luctus quam ultrices rutrum</td>
                                                                            <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                            <td>R$1.150,00</td>
                                                                            <td>R$2.450,00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="hidden"><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                            <td>
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
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
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                            </td>
                                                                            <td>Fusce id molestie massa</td>
                                                                            <td><input type="text" value="1" class="input-mini"></td>
                                                                            <td>R$2.350,00</td>
                                                                            <td>R$2.350,00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                            <td>
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
                                                                            </td>
                                                                            <td>Luctus quam ultrices rutrum</td>
                                                                            <td><input type="text" placeholder="2" value="2" class="input-mini"></td>
                                                                            <td>R$1.150,00</td>
                                                                            <td>R$2.450,00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><input type="checkbox" onchange="handlerCheckItem(this)"></td>
                                                                            <td>
                                                                                <a href="product_detail.html"><img alt="" src="static/themes/images/camiseta.png" class="thumbnails small"></a>
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
                            </section>
                            <section class="meu_cadastro">
                                <h4 class="title"><span class="text"><strong>Meu</strong> Cadastro</span></h4>
                                <input type="hidden" name="next" value="/">
                                <div class="span1 col"></div>
                                <div class="span12 col">
                                    <fieldset>
                                        <div class="control-group">
                                            <label class="control-label">Usuário*:</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite seu usuário" id="username" class="input-xlarge" disabled>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Senha*:</label>
                                            <div class="controls">
                                                <input type="password" placeholder="Digite sua senha" id="password" class="input-xlarge" disabled>
                                            </div>
                                        </div>
                                        <hr>
                                    </fieldset>
                                </div>
                                <div class="span5 col">
                                    <fieldset>
                                        <div class="control-group">
                                            <label class="control-label">Nome completo*:</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite o nome completo" id="nome_completo" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Data de nascimento*:</label>
                                            <div class="controls">
                                                <input type="date" id="data_nascimento" class="input-xlarge">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Gênero*:</label>
                                            <select class="controls" id="genero">
                                    <option value="feminino">Feminino</option>
                                    <option value="masculino">Masculino</option>
                                    <option value="outro">Outro</option>
                                </select>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">CPF*:</label>
                                            <div class="controls">
                                                <input type="text" placeholder="Digite seu cpf" id="cpf" class="input-xlarge" required>
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
                                                <input type="email" placeholder="Digite seu email" id="email" class="input-xlarge" required>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Telefone*:</label>
                                            <div class="controls">
                                                <input type="tel" placeholder="XX" id="telefone_ddd" class="input-mini" required>
                                                <input type="tel" placeholder="XXXXX-XXXX" id="telefone_numero" class="input-small" required>
                                                <select class="controls" id="telefone_tipo" required>
                                        <option value="residencial">Residencial</option>
                                        <option value="celular">Celular</option>
                                        <option value="comercial">Comercial</option>
                                    </select>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </section>
                            <section class="meus_enderecos">
                                <div class="span12">
                                    <h4 class="title"><span class="text"><strong>Endereços</strong> Cobrança</span></h4>
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#endereco_1">
                                        <h4><span class="text"><strong>Endereço</strong> 1</span></h4>
                                    </a>
                                    <div id="endereco_1" class="accordion-body collapse">
                                        <div class="accordion-inner">
                                            <div class="row-fluid">
                                                <div class="span5 col">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <label class="control-label">Frase curta para nomear endereço*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de residência*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_residencia" required>
                                                        <option value="casa">Casa</option>
                                                        <option value="apartamento">Apartamento</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">CEP*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_cep" class="input-small" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de logradouro*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_logradouro" required>
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
                                                                <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Número*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_numero" class="input-mini" required>
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
                                                                <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Cidade*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Estado*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">País*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge" required>
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
                            <section class="cadastrar_novo_endereco">
                                <div class="span12">
                                    <button><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#cadastrar_novo_endereco">
                                <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                            </a></button>
                                    <div id="cadastrar_novo_endereco" class="accordion-body collapse">
                                        <div class="accordion-inner">
                                            <div class="row-fluid">
                                                <div class="span5 col">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <label class="control-label">Frase curta para nomear endereço*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de residência*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_residencia" required>
                                                        <option value="casa">Casa</option>
                                                        <option value="apartamento">Apartamento</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">CEP*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_cep" class="input-small" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de logradouro*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_logradouro" required>
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
                                                                <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Número*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_numero" class="input-mini" required>
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
                                                                <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Cidade*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Estado*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">País*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge" required>
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
                            <section class="meus_enderecos">
                                <div class="span12">
                                    <h4 class="title"><span class="text"><strong>Endereços</strong> Entrega</span></h4>
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#endereco_1">
                                        <h4><span class="text"><strong>Endereço</strong> 1</span></h4>
                                    </a>
                                    <div id="endereco_1" class="accordion-body collapse">
                                        <div class="accordion-inner">
                                            <div class="row-fluid">
                                                <div class="span5 col">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <label class="control-label">Frase curta para nomear endereço*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de residência*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_residencia" required>
                                                        <option value="casa">Casa</option>
                                                        <option value="apartamento">Apartamento</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">CEP*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_cep" class="input-small" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de logradouro*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_logradouro" required>
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
                                                                <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Número*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_numero" class="input-mini" required>
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
                                                                <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Cidade*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Estado*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">País*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge" required>
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
                            <section class="cadastrar_novo_endereco">
                                <div class="span12">
                                    <button><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#cadastrar_novo_endereco">
                                <h4><span class="text"><strong>Cadastrar</strong> novo endereço</span></h4>
                            </a></button>
                                    <div id="cadastrar_novo_endereco" class="accordion-body collapse">
                                        <div class="accordion-inner">
                                            <div class="row-fluid">
                                                <div class="span5 col">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <label class="control-label">Frase curta para nomear endereço*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de residência*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_residencia" required>
                                                        <option value="casa">Casa</option>
                                                        <option value="apartamento">Apartamento</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">CEP*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_cep" class="input-small" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Tipo de logradouro*:</label>
                                                            <select class="controls" id="endereco_entrega_tipo_logradouro" required>
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
                                                                <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Número*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_numero" class="input-mini" required>
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
                                                                <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Cidade*:</label>
                                                            <div class="controls">
                                                                <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" class="input-xlarge" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">Estado*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_estado" placeholder="Ex*: SP" class="input-mini" required>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label">País*:</label>
                                                            <div class="controls">
                                                                <input type="text" id="endereco_entrega_pais" placeholder="Ex*: Brasil" class="input-xlarge" required>
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
                                        </label>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
            </div>
            </section>
            <section id="footer-bar">
                <div class="row">
                    <div class="span3">
                        <h4>Navegação</h4>
                        <ul class="nav">
                            <li><a href="./index.html">HOME</a></li>
                            <li><a href="./about.html">Sobre</a></li>
                            <li><a href="./contact.html">Contato</a></li>
                            <li><a href="./cart.html">Carrinho</a></li>
                            <li><a href="./login.html">Entrar</a></li>
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

            let handlerCheckItem = (item) => {
                item.parentElement.parentElement.children.item(3).children.item(0).readOnly = !item.checked
            }
        </script>

        </html>
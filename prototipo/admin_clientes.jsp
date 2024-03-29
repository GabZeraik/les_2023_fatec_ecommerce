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
                            <input type="text" class="input-block-level search-query" placeholder="Pesquisar cliente">
                        </form>
                    </div>
                    <div class="span5 col">
                        <h4 class="title">Filtros</h4>
                        <ul style="list-style-type:circle">
                            <li><input type="checkbox">Status</li>
                            <li><input type="checkbox">Usuário</li>
                            <li><input type="checkbox">Nome completo</li>
                            <li><input type="checkbox">Data de nascimento</li>
                            <li><input type="checkbox">Gênero</li>
                            <li><input type="checkbox">CPF</li>
                            <li><input type="checkbox">Email</li>
                            <li><input type="checkbox">Telefone</li>
                            <li><input type="checkbox">Endereço</li>
                            <li><input type="checkbox">Ranking</li>
                        </ul>
                    </div>
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
                                    <tr>
                                        <td>Ativo</td>
                                        <td>123456</td>
                                        <td>João Maria</td>
                                        <td>10/10/1988</td>
                                        <td>Masculino</td>
                                        <td>152.152.135-99</td>
                                        <td>abcdefg@gmail.com</td>
                                        <td>11999889988</td>
                                        <td><a>Casa1</a>, <a>Trabalho</a></td>
                                        <td>3</td>
                                        <td></td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Inativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Ativo</td>
                                        <td>
                                            123456
                                        </td>
                                        <td>João Maria</td>
                                        <td>10/10/1988</td>
                                        <td>Masculino</td>
                                        <td>152.152.135-99</td>
                                        <td>abcdefg@gmail.com</td>
                                        <td>11999889988</td>
                                        <td><a>Casa1</a>, <a>Trabalho</a></td>
                                        <td>3</td>
                                        <td></td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Inativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Ativo</td>
                                        <td>
                                            123456
                                        </td>
                                        <td>João Maria</td>
                                        <td>10/10/1988</td>
                                        <td>Masculino</td>
                                        <td>152.152.135-99</td>
                                        <td>abcdefg@gmail.com</td>
                                        <td>11999889988</td>
                                        <td><a href="#">Casa1</a>,
                                            <a href="#">Trabalho</a>
                                        </td>
                                        <td>3</td>
                                        <td></td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Inativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Inativo</td>
                                        <td>
                                            123456
                                        </td>
                                        <td>João Maria</td>
                                        <td>10/10/1988</td>
                                        <td>Masculino</td>
                                        <td>152.152.135-99</td>
                                        <td>abcdefg@gmail.com</td>
                                        <td>11999889988</td>
                                        <td><a>Casa1</a>, <a>Trabalho</a></td>
                                        <td>3</td>
                                        <td>Informações de cobrança incorretas</td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Ativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Inativo</td>
                                        <td>
                                            123456
                                        </td>
                                        <td>João Maria</td>
                                        <td>10/10/1988</td>
                                        <td>Masculino</td>
                                        <td>152.152.135-99</td>
                                        <td>abcdefg@gmail.com</td>
                                        <td>11999889988</td>
                                        <td><a>Casa1</a>, <a>Trabalho</a></td>
                                        <td>3</td>
                                        <td>Informações de cobrança incorretas</td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Ativar</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Cadastrar Novo Cliente" onclick="editHandler()"></div>
                    </div>
                </section>
                <section class="hidden" id="editar_cadastro_produto">
                    <div class="row">
                        <form action="#" method="post">
                            <div class="span12">
                                <section class="pedidos_cliente">
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
                                <section class="cadastro_cliente">
                                    <h4 class="title"><span class="text"><strong>Cadastro</strong> Cliente</span></h4>
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
                </section>
                <section class="hidden" id="editar_status_produto">
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
            <script type="text/javascript">
                const formAlteracao = document.querySelector('#editar_cadastro_produto');
                const formStatus = document.querySelector('#editar_status_produto');

                let editHandler = (produto) => {
                    formStatus.classList.toggle('hidden', true);
                    formAlteracao.classList.toggle('hidden', false);
                }

                let statusHandler = (produto) => {
                    formAlteracao.classList.toggle('hidden', true);
                    formStatus.classList.toggle('hidden', false);
                }
            </script>
        </body>

        </html>
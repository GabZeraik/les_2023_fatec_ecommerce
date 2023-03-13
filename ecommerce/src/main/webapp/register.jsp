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
			<script src="http*://html5shim.googlecode.com/svn/trunk/html5.js"></script>
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
                        <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="Acessar conta ou entrar">
                    </section>
                    <section class="main-content">
                        <div class="row">
                            <form id="formCadastrarCliente" action="CadastrarCliente" method="post">
                                <div class="span12">
                                    <section class="completar-cadastro">
                                        <h4 class="title"><span class="text"><strong>Completar</strong> Cadastro</span></h4>
                                        <div class="span1 col"></div>
                                        <div class="span12 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Usuário*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite seu usuário" id="usuario" name="usuario_cliente" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Senha*:</label>
                                                    <div class="controls">
                                                        <input type="password" placeholder="Digite sua senha" id="senha" name="senha_cliente" class="input-xlarge" required>
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
                                                        <input type="text" placeholder="Digite o nome completo" id="nome_completo" name="nome_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Data de nascimento*:</label>
                                                    <div class="controls">
                                                        <input type="date" id="data_nascimento" name="data_nascimento_cliente" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Gênero*:</label>
                                                    <select class="controls" id="genero" name="genero_cliente">
                                                        <option value="feminino" selected>Feminino</option>
                                                        <option value="masculino">Masculino</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">CPF*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite seu cpf" id="cpf" name="cpf_cliente" class="input-xlarge" required>
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
                                                        <input type="email" placeholder="Digite seu email" id="email" name="email_cliente" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Telefone*:</label>
                                                    <div class="controls">
                                                        <input type="tel" placeholder="XX" id="telefone_ddd" name="telefone_ddd_cliente" class="input-mini" required>
                                                        <input type="tel" placeholder="XXXXX-XXXX" id="telefone_numero" name="telefone_numero_cliente" class="input-small" required>
                                                        <select class="controls" id="telefone_tipo" name="telefone_tipo_cliente" required>
                                                            <option value="residencial" selected>Residencial</option>
                                                            <option value="celular">Celular</option>
                                                            <option value="comercial">Comercial</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </section>
                                    <section class="endereco-entrega">
                                        <h4 class="title"><span class="text"><strong>Endereço</strong> Entrega</span></h4>
                                        <div class="span5 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Frase curta para nomear endereço*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_entrega_frase_curta" name="endereco_entrega_frase_cliente" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Tipo de residência*:</label>
                                                    <select class="controls" id="endereco_entrega_tipo_residencia" name="endereco_entrega_tipo_residencia_cliente" required>
                                                        <option value="casa" selected>Casa</option>
                                                        <option value="apartamento">Apartamento</option>
                                                        <option value="outro">Outro</option>
                                                    </select>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">CEP*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_entrega_cep" name="endereco_entrega_cep_cliente" class="input-small" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Tipo de logradouro*:</label>
                                                    <select class="controls" id="endereco_entrega_tipo_logradouro" name="endereco_entrega_tipo_logradouro_cliente" required>
                                                        <option value="rua" selected>Rua</option>
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
                                                        <input type="text" placeholder="Digite o logradouro" id="endereco_entrega_logradouro" name="endereco_entrega_logradouro_cliente" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Número*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_entrega_numero" name="endereco_entrega_numero_cliente" class="input-mini" required>
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
                                                        <input type="text" placeholder="Digite o bairro" id="endereco_entrega_bairro" name="endereco_entrega_bairro_cliente" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Cidade*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite a cidade" id="endereco_entrega_cidade" name="endereco_entrega_cidade_cliente" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Estado*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_entrega_estado" name="endereco_entrega_estado_cliente" placeholder="Ex*: SP" class="input-mini" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">País*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_entrega_pais" name="endereco_entrega_pais_cliente" placeholder="Ex*: Brasil" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Observação:</label>
                                                    <div class="controls">
                                                        <textarea id="endereco_entrega_observacao" name="endereco_entrega_observacao_cliente" placeholder="Opcional" class="input-xlarge"></textarea>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </section>
                                    <section class="endereco-cobranca">
                                        <h4 class="title"><span class="text"><strong>Endereço</strong> Cobrança</span></h4>
                                        <div class="span12">
                                            <label class="checkbox">
                                            <input type="checkbox" id="check_mesmo_endereco_cobranca">Utilizar o mesmo endereço de entrega
                                            <input type="hidden" name="check_mesmo_endereco_cobranca" value="false">
                                        </label>
                                            <hr>
                                        </div>
                                        <div class="" id="div_endereco_cobranca">
                                            <div class="span5 col">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label">Frase curta para nomear endereço*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Ex: Minha casa; casa dos pais etc." id="endereco_cobranca_frase_curta" name="endereco_cobranca_frase_cliente" class="input-xlarge" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de residência*:</label>
                                                        <select class="controls" id="endereco_cobranca_tipo_residencia" name="endereco_cobranca_tipo_residencia_cliente" required>
                                                            <option value="casa" selected>Casa</option>
                                                            <option value="apartamento">Apartamento</option>
                                                            <option value="outro">Outro</option>
                                                        </select>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">CEP*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_cobranca_cep" name="endereco_cobranca_cep_cliente" class="input-small" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Tipo de logradouro*:</label>
                                                        <select class="controls" id="endereco_cobranca_tipo_logradouro" name="endereco_cobranca_tipo_logradouro_cliente" required>
                                                            <option value="rua" selected>Rua</option>
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
                                                            <input type="text" placeholder="Digite o logradouro" id="endereco_cobranca_logradouro" name="endereco_cobranca_logradouro_cliente" class="input-xlarge" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Número*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_cobranca_numero" name="endereco_cobranca_numero_cliente" class="input-mini" required>
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
                                                            <input type="text" placeholder="Digite o bairro" id="endereco_cobranca_bairro" name="endereco_cobranca_bairro_cliente" class="input-xlarge" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Cidade*:</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="Digite a cidade" id="endereco_cobranca_cidade" name="endereco_cobranca_cidade_cliente" class="input-xlarge" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Estado*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_cobranca_estado" name="endereco_cobranca_estado_cliente" placeholder="Ex*: SP" class="input-mini" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">País*:</label>
                                                        <div class="controls">
                                                            <input type="text" id="endereco_cobranca_pais" name="endereco_cobranca_pais_cliente" placeholder="Ex*: Brasil" class="input-xlarge" required>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Observação:</label>
                                                        <div class="controls">
                                                            <textarea id="endereco_cobranca_observacao" name="endereco_cobranca_observacao_cliente" placeholder="Opcional" class="input-xlarge"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </section>
                                    <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" name="operacao" value="SALVAR"></div>
                                </div>
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
                <script src="themes/js/common.js"></script>
                <script>
                    const cb = document.querySelector('#check_mesmo_endereco_cobranca');
                    cb.addEventListener('change', () => {
                        cb.value = cb.checked;
                        document.querySelector('#div_endereco_cobranca').classList.toggle('hidden');
                        if (cb.checked) preencheFormCobranca();
                    });
                    const preencheFormCobranca = () => {
                        document.querySelector('#endereco_cobranca_frase_curta').value = document.querySelector('#endereco_entrega_frase_curta').value
                        document.querySelector('#endereco_cobranca_tipo_residencia').value = document.querySelector('#endereco_entrega_tipo_residencia').value
                        document.querySelector('#endereco_cobranca_cep').value = document.querySelector('#endereco_entrega_cep').value
                        document.querySelector('#endereco_cobranca_tipo_logradouro').value = document.querySelector('#endereco_entrega_tipo_logradouro').value
                        document.querySelector('#endereco_cobranca_logradouro').value = document.querySelector('#endereco_entrega_logradouro').value
                        document.querySelector('#endereco_cobranca_numero').value = document.querySelector('#endereco_entrega_numero').value
                        document.querySelector('#endereco_cobranca_bairro').value = document.querySelector('#endereco_entrega_bairro').value
                        document.querySelector('#endereco_cobranca_cidade').value = document.querySelector('#endereco_entrega_cidade').value
                        document.querySelector('#endereco_cobranca_estado').value = document.querySelector('#endereco_entrega_estado').value
                        document.querySelector('#endereco_cobranca_pais').value = document.querySelector('#endereco_entrega_pais').value
                        document.querySelector('#endereco_cobranca_observacao').value = document.querySelector('#endereco_entrega_observacao').value
                    }
                </script>
            </body>

            </html>
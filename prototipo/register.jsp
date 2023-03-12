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
			<script src="http*://html5shim.googlecode.com/svn/trunk/html5.js"></script>
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
                    <img class="pageBanner" src="static/themes/images/pageBanner.png" alt="Acessar conta ou entrar">
                </section>
                <section class="main-content">
                    <div class="row">
                        <form action="#" method="post">
                            <div class="span12">
                                <section class="completar-cadastro">
                                    <h4 class="title"><span class="text"><strong>Completar</strong> Cadastro</span></h4>
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
                                <section class="endereco-entrega">
                                    <h4 class="title"><span class="text"><strong>Endereço</strong> Entrega</span></h4>
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
                                </section>
                                <section class="endereco-cobranca">
                                    <h4 class="title"><span class="text"><strong>Endereço</strong> Cobrança</span></h4>
                                    <div class="span12">
                                        <label class="checkbox">
                                    <input type="checkbox" name="check_mesmo_endereco_cobranca" id="check_mesmo_endereco_cobranca" onchange="document.querySelector('#div_endereco_cobranca').classList.toggle('hidden')">Utilizar o mesmo endereço de entrega
                                </label>
                                        <hr>
                                    </div>
                                    <div class="" id="div_endereco_cobranca">
                                        <div class="span5 col">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Tipo de residência*:</label>
                                                    <select class="controls" id="endereco_cobranca_tipo_residencia" required>
                                                <option value="casa">Casa</option>
                                                <option value="apartamento">Apartamento</option>
                                                <option value="outro">Outro</option>
                                            </select>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">CEP*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_cobranca_cep" class="input-small" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Tipo de logradouro*:</label>
                                                    <select class="controls" id="endereco_cobranca_tipo_logradouro" required>
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
                                                        <input type="text" placeholder="Digite o logradouro" id="endereco_cobranca_logradouro" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Número*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_cobranca_numero" class="input-mini" required>
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
                                                        <input type="text" placeholder="Digite o bairro" id="endereco_cobranca_bairro" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Cidade*:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="Digite a cidade" id="endereco_cobranca_cidade" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Estado*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_cobranca_estado" placeholder="Ex*: SP" class="input-mini" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">País*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="endereco_cobranca_pais" placeholder="Ex*: Brasil" class="input-xlarge" required>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Observação:</label>
                                                    <div class="controls">
                                                        <textarea id="endereco_cobranca_observacao" placeholder="Opcional" class="input-xlarge"></textarea>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </section>
                                <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Finalizar cadastro"></div>
                            </div>
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
            <script src="themes/js/common.js"></script>
            <script>
                $(document).ready(function() {
                    $('#checkout').click(function(e) {
                        document.location.href = "checkout.html";
                    })
                });
            </script>
        </body>

        </html>
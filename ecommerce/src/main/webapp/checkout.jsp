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
                        <div class="span8">
                            <div class="account pull-right">
                                <ul class="user-menu">
                                    <c:if test="${usuario_logado.nome != null}">
                                        <div class="span3">
                                            <span>Bem vindo ${usuario_logado.nome}</span>
                                        </div>
                                        <li><a href="#">Minha conta</a></li>
                                    </c:if>
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
                    <section class="main-content">
                        <div class="row">
                            <div class="span12">
                                <div class="accordion" id="accordion2">
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                                <h4>Entrar</h4>
                                            </a>
                                        </div>
                                        <div id="collapseOne" class="accordion-body in collapse">
                                            <div class="accordion-inner">
                                                <div class="span6">
                                                    <p>Entre com seu cadastro para finalizar a compra</p>
                                                    <form action="#" method="post">
                                                        <fieldset>
                                                            <div class="control-group">
                                                                <label class="control-label">Usuário</label>
                                                                <div class="controls">
                                                                    <input type="text" placeholder="Digite seu usuário" id="username" class="input-xlarge">
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label">Senha</label>
                                                                <div class="controls">
                                                                    <input type="password" placeholder="Digite sua senha" id="password" class="input-xlarge">
                                                                </div>
                                                            </div>
                                                            <button class="btn btn-inverse">Entrar</button>
                                                        </fieldset>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-group">
                                    <div class="accordion-heading">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                            <h4 class="title"><span class="text">Dados e endereço de entrega</span></h4>
                                        </a>
                                    </div>
                                    <div id="collapseTwo" class="accordion-body collapse">
                                        <div class="accordion-inner">
                                            <div class="row-fluid">
                                                <div class="span6">
                                                    <h4>Resumo dos dados</h4>
                                                    <div class="control-group">
                                                        <label class="control-label">Nome completo</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="" class="input-xlarge" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Email</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="" class="input-xlarge" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Telefone</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="" class="input-xlarge" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">Data de nascimento</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="" class="input-xlarge" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label">CPF</label>
                                                        <div class="controls">
                                                            <input type="text" placeholder="" class="input-xlarge" disabled>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="span6">
                                                        <h4>Endereço de entrega</h4>
                                                        <p>Escolha o endereço de entrega desejado ou cadastre um novo</p>
                                                        <form action="#" method="post">
                                                            <fieldset>
                                                                <label class="radio" for="endereco_1">
															<input type="radio" name="radio_endereco_entrega_checkout" value="endereco_1" id="endereco_1" checked="checked" onclick="radioHandlerEndereco(this);">Casa
														</label>
                                                                <label class="radio" for="endereco_2">
															<input type="radio" name="radio_endereco_entrega_checkout" value="endereco_2" id="endereco_2" onclick="radioHandlerEndereco(this);">Endereço 2
														</label>
                                                                <label class="radio" for="cb_cadastrar_novo_endereco">
															<input type="radio" name="radio_endereco_entrega_checkout" value="cadastrar_novo_end" id="cb_cadastrar_novo_endereco" onclick="radioHandlerEndereco(this);">Cadastrar novo endereço
														</label>
                                                                <br>
                                                                <button class="btn btn-inverse" data-toggle="collapse" data-parent="#collapse2" id="btn_continuar">Continuar</button>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                    <section class="endereco-entrega">
                                                        <div class="span6">
                                                            <div class="hidden" id="div_endereco_entrega">
                                                                <form action="#" method="post">
                                                                    <div class="span5 col">
                                                                        <fieldset>
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
                                                                    <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Cadastrar endereço"></div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
            </script>

            </html>
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
                            <li><input type="checkbox">Cód. Pedido</li>
                            <li><input type="checkbox">Status</li>
                            <li><input type="checkbox">Cód. Cliente</li>
                            <li><input type="checkbox">Endereço</li>
                            <li><input type="checkbox">Data Pedido</li>
                            <li><input type="checkbox">Valor Final</li>
                            <li><input type="checkbox">Última atualização</li>
                            <li><input type="checkbox">Modificado por</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="wrapper" class="container">
                <section class="main-content">
                    <div class="row">
                        <div class="span12">
                            <h4 class="title"><span class="text"><strong>ADMINISTRAÇÃO</strong> Pedidos</span></h4>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Cód. Pedido</th>
                                        <th>Status</th>
                                        <th>Cód. Cliente</th>
                                        <th>Cód. Endereço</th>
                                        <th>Data Pedido</th>
                                        <th>Valor Final</th>
                                        <th>Última atualização</th>
                                        <th>Modificado por</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>123456</td>
                                        <td>EM PROCESSAMENTO</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023 14:20</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023 12:35</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>EM TRÂNSITO</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023 14:20</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023 12:35</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>ENTREGUE</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023 14:20</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023 12:35</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>EM TROCA</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023 14:20</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023 12:35</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>TROCA AUTORIZADA</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023 14:20</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>APROVADO</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>REPROVADO</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                    <tr>
                                        <td>123456</td>
                                        <td>TROCADO</td>
                                        <td>123456</td>
                                        <td>0001536</td>
                                        <td>10/10/2023 14:20</td>
                                        <td>R$250,30</td>
                                        <td>11/10/2023 12:35</td>
                                        <td>Gabriel</td>
                                        <td><button onclick="editHandler(this)">Alterar Pedido</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
                <section class="hidden" id="editar_cadastro_produto">
                    <div class="row">
                        <form action="#" method="post">
                            <div class="span12">
                                <section class="alterar_pedido">
                                    <h4 class="title"><span class="text"><strong>Alterar</strong> Pedido</span></h4>
                                    <input type="hidden" name="next" value="/">
                                    <div class="span5 col">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label">Usuário*:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="Código do Cliente" id="username" class="input-xlarge" disabled>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Status*:</label>
                                                <select class="controls" id="status_pedido">
                                            <option value="em_processamento">EM PROCESSAMENTO</option>
                                            <option value="em_transito">EM TRÂNSITO</option>
                                            <option value="entregue">ENTREGUE</option>
                                            <option value="em_troca">EM TROCA</option>
                                            <option value="troca_autorizada">TROCA AUTORIZADA</option>
                                            <option value="aprovado">APROVADO</option>
                                            <option value="reprovado">REPROVADO</option>
                                            <option value="trocado">TROCADO</option>
                                        </select>
                                            </div>
                                        </fieldset>
                                        <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Alterar Pedido"></div>
                                    </div>
                                    <hr>
                                    <h4 class="title"><span class="text"><strong>Gerar</strong> Cupom</span></h4>
                                    <div class="span5 col">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label">Valor Cupom*:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="Digite seu usuário" id="username" class="input-xlarge">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Tipo*:</label>
                                                <div class="controls">
                                                    <select class="controls" id="gerar_cupom_tipo_pedido">
                                                    <option value="promocional">PROMOCIONAL</option>
                                                    <option value="troca">TROCA</option>
                                                    <option value="desconto">DESCONTO</option>
                                                </select>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Gerar Cupom"></div>
                                    </div>
                                </section>

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
            <script type="text/javascript">
                const formAlteracao = document.querySelector('#editar_cadastro_produto');

                let editHandler = (produto) => {
                    formAlteracao.classList.toggle('hidden', false);
                }
            </script>
        </body>

        </html>
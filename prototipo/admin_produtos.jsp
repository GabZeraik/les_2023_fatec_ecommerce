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
                    <div class="span5 col">
                        <h4 class="title">Filtros</h4>
                        <ul style="list-style-type:circle">
                            <li><input type="checkbox">Status</li>
                            <li><input type="checkbox">Cód. Único</li>
                            <li><input type="checkbox">Categorias</li>
                            <li><input type="checkbox">Nome</li>
                            <li><input type="checkbox">Tamanho</li>
                            <li><input type="checkbox">Cor</li>
                            <li><input type="checkbox">Gênero</li>
                            <li><input type="checkbox">Grupo Preço</li>
                            <li><input type="checkbox">Preço atual</li>
                            <li><input type="checkbox">Valor Custo</li>
                            <li><input type="checkbox">Cód. Barras</li>
                            <li><input type="checkbox">Estoque</li>
                            <li><input type="checkbox">Cat. Status/Justificativa</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="wrapper" class="container">
                <section class="main-content">
                    <div class="row">
                        <div class="span12">
                            <h4 class="title"><span class="text"><strong>ADMINISTRAÇÃO</strong> Produtos</span></h4>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Cód. Único</th>
                                        <th>Categorias</th>
                                        <th>Nome</th>
                                        <th>Tamanho</th>
                                        <th>Cor</th>
                                        <th>Gênero</th>
                                        <th>Grupo Preço</th>
                                        <th>Preço atual</th>
                                        <th>Valor Custo</th>
                                        <th>Cód. Barras</th>
                                        <th>Estoque</th>
                                        <th>Cat. Status/Justificativa</th>
                                        <th colspan="3"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Ativo</td>
                                        <td>
                                            <a href="product_detail.html">22236</a>
                                        </td>
                                        <td>Casual, Unissex</td>
                                        <td>Camiseta</td>
                                        <td>P</td>
                                        <td>Azul</td>
                                        <td>Unissex</td>
                                        <td>A</td>
                                        <td>R$2.350,00</td>
                                        <td>R$350,00</td>
                                        <td>1152364584</td>
                                        <td>120</td>
                                        <td></td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Inativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Ativo</td>
                                        <td>
                                            <a href="product_detail.html">22237</a>
                                        </td>
                                        <td>Casual, Unissex</td>
                                        <td>Camiseta</td>
                                        <td>P</td>
                                        <td>Azul</td>
                                        <td>Unissex</td>
                                        <td>A</td>
                                        <td>R$2.350,00</td>
                                        <td>R$350,00</td>
                                        <td>1152364584</td>
                                        <td>120</td>
                                        <td></td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Inativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Ativo</td>
                                        <td>
                                            <a href="product_detail.html">22238</a>
                                        </td>
                                        <td>Casual, Unissex</td>
                                        <td>Camiseta</td>
                                        <td>P</td>
                                        <td>Azul</td>
                                        <td>Unissex</td>
                                        <td>A</td>
                                        <td>R$2.350,00</td>
                                        <td>R$350,00</td>
                                        <td>1152364584</td>
                                        <td>120</td>
                                        <td></td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Inativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Inativo</td>
                                        <td>
                                            <a href="product_detail.html">22239</a>
                                        </td>
                                        <td>Casual, Unissex</td>
                                        <td>Camiseta</td>
                                        <td>P</td>
                                        <td>Azul</td>
                                        <td>Unissex</td>
                                        <td>A</td>
                                        <td>R$2.350,00</td>
                                        <td>R$350,00</td>
                                        <td>1152364584</td>
                                        <td>0</td>
                                        <td>DEFEITOS - O produto vem apresentando defeitos de fabricação recorrentes.</td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Ativar</button></td>
                                    </tr>
                                    <tr>
                                        <td>Inativo</td>
                                        <td>
                                            <a href="product_detail.html">22240</a>
                                        </td>
                                        <td>Casual, Unissex</td>
                                        <td>Camiseta</td>
                                        <td>P</td>
                                        <td>Azul</td>
                                        <td>Unissex</td>
                                        <td>A</td>
                                        <td>R$2.350,00</td>
                                        <td>R$350,00</td>
                                        <td>1152364584</td>
                                        <td>0</td>
                                        <td>FORA DE MERCADO - Automática</td>
                                        <td></td>
                                        <td><button onclick="editHandler(this)">Editar</button></td>
                                        <td><button>Excluir</button></td>
                                        <td><button onclick="statusHandler(this)">Ativar</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Cadastrar Novo Produto" onclick="editHandler()"></div>
                    </div>
                </section>
                <section class="hidden" id="editar_cadastro_produto">
                    <div class="row">
                        <form action="#" method="post">
                            <div class="span12">
                                <section class="cadastro_produto">
                                    <h4 class="title"><span class="text"><strong>Alterar/Cadastrar</strong> Produto</span></h4>
                                    <div class="span1 col"></div>
                                    <div class="span5 col">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label">Nome do produto:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="Digite o nome completo" id="nome_produto" class="input-xlarge">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Tamanho:</label>
                                                <div class="controls">
                                                    <input type="text" id="tamanho_produto" class="input-xlarge">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Gênero:</label>
                                                <select class="controls" id="genero_produto">
                                        <option value="feminino">Feminino</option>
                                        <option value="masculino">Masculino</option>
                                        <option value="unissex">Unissex</option>
                                        <option value="infantil">Infantil</option>
                                    </select>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="span5 col">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label">Cor:</label>
                                                <div class="controls">
                                                    <input type="text" placeholder="Digite a cor" id="cor_produto" class="input-xlarge" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Código de Barras:</label>
                                                <div class="controls">
                                                    <input type="text" id="cod_barras_produto" class="input-xlarge">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Grupo de Precificação:</label>
                                                <select class="controls" id="grupo_preco_produto">
                                            <option value="a">A</option>
                                            <option value="b">B</option>
                                            <option value="c">C</option>
                                            <option value="d">D</option>
                                        </select>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Finalizar cadastro/edição"></div>
                                </section>
                                <section class="cadastro_estoque_produto">
                                    <h4 class="title"><span class="text"><strong>Estoque</strong> Produto</span></h4>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Cód. Entrada</th>
                                                <th>Cód. Produto</th>
                                                <th>Quantidade</th>
                                                <th>Valor Custo</th>
                                                <th>Fornecedor</th>
                                                <th>Data Entrada</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>123456</td>
                                                <td>
                                                    <a href="product_detail.html">22236</a>
                                                </td>
                                                <td>30</td>
                                                <td>R$350,00</td>
                                                <td>Fábrica de Camisetas</td>
                                                <td>01/01/2023</td>
                                            </tr>
                                            <tr>
                                                <td>123456</td>
                                                <td>
                                                    <a href="product_detail.html">22236</a>
                                                </td>
                                                <td>30</td>
                                                <td>R$350,00</td>
                                                <td>Fábrica de Camisetas</td>
                                                <td>05/01/2023</td>
                                            </tr>
                                            <tr>
                                                <td>123456</td>
                                                <td>
                                                    <a href="product_detail.html">22236</a>
                                                </td>
                                                <td>30</td>
                                                <td>R$350,00</td>
                                                <td>Fábrica de Camisetas</td>
                                                <td>10/01/2023</td>
                                            </tr>
                                            <tr>
                                                <td>123456</td>
                                                <td>
                                                    <a href="product_detail.html">22236</a>
                                                </td>
                                                <td>30</td>
                                                <td>R$350,00</td>
                                                <td>Fábrica de Camisetas</td>
                                                <td>15/01/2023</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="span8 col">
                                        <h5 class="title"><span class="text"><strong>Adicionar</strong> Estoque</span></h5>
                                        <form>
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label">Código Único Produto:</label>
                                                    <div class="controls">
                                                        <input type="text" id="cod_unico_estoque" class="input-xlarge" disabled>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Valor de Custo*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="valor_estoque" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Quantidade Estoque*:</label>
                                                    <div class="controls">
                                                        <input type="number" id="estoque_estoque" class="input-mini" min="1">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Fornecedor*:</label>
                                                    <div class="controls">
                                                        <input type="text" id="fornecedor_estoque" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Data de entrada:</label>
                                                    <div class="controls">
                                                        <input type="date" id="data_entrada_estoque" class="input-large" value="2023-02-27">
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="actions" style="float: left"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Adicionar Item"></div>
                                        </form>
                                    </div>
                                </section>
                            </div>
                        </form>
                    </div>
                </section>
                <section class="hidden" id="editar_status_produto">
                    <div class="row">
                        <form action="#" method="post">
                            <div class="span12">
                                <h4 class="title"><span class="text"><strong>Ativar/Inativar</strong> Produto</span></h4>
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
                                <option value="defeitos">DEFEITOS</option>
                                <option value="fora_de_mercado">FORA DE MERCADO</option>
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
                            <div class="actions" style="float: right"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Editar Status Produto"></div>
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
<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
            <html>

            <head>
                <meta charset="UTF-8">
                <link rel="stylesheet" href="static/css/styles.css" />
                <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
                <title>Gest�o Acad�mica</title>
            </head>

            <body>
                <div class="app-container">
                    <div class="sidebar">
                        <div class="sidebar-header">
                            <div class="app-icon">
                                <span class="icon-principal">&#128214</span>
                            </div>
                            <span>Gest�o Acad�mica</span>
                            <span>ESIII - 2022</span>
                        </div>
                        <ul class="sidebar-list">
                            <li class="sidebar-list-item" id="link-menu-home" onclick="alterarElementos(this)">
                                <a href="index.jsp">
                                    <span class="icon-item-sidebar"></span>
                                    <span>Home</span>
                                </a>
                            </li>
                            <li class="sidebar-list-item" id="link-menu-Curso">
                                <a href="cursos.jsp">
                                    <span class="icon-item-sidebar">&#128218;</span>
                                    <span>Cursos</span>
                                </a>
                            </li>
                            <li class="sidebar-list-item active" id="link-menu-Aluno">
                                <a onclick="document.querySelector('#btn-alunos').click()">
                                    <form id="AlunosRedirect" action="ConsultarCursosAlunos" method="get">
                                        <input type="hidden" class="search-bar escondido" type="text" name="allItems" value="0">
                                        <span class="icon-item-sidebar">&#127891;</span>
                                        <span>Alunos</span>
                                        <button id="btn-alunos" class="escondido" form="AlunosRedirect" type="submit" id="operacao" name="operacao" value="CONSULTAR"></button>
                                    </form>
                                </a>
                            </li>
                            <li class="sidebar-list-item" id="link-menu-Professor">
                                <a onclick="document.querySelector('#btn-professores').click()">
                                    <form id="ProfessoresRedirect" action="ConsultarCursosProfessores" method="get">
                                        <input type="hidden" class="search-bar escondido" type="text" name="allItems" value="0">
                                        <span class="icon-item-sidebar">&#128100;</span>
                                        <span>Professores</span>
                                        <button id="btn-professores" class="escondido" type="submit" id="operacao" name="operacao" value="CONSULTAR"></button>
                                    </form>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="app-content" id="site-container">
                        <div class="modal-form closed" id="modal-form">
                            <div class="details-modal-overlay" onclick="this.parentNode.classList.toggle('closed')"></div>
                            <div class="details-modal">
                                <div class="details-modal-close" id="fechar-modal-form">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
		                	<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7071 1.70711C14.0976 1.31658 14.0976 0.683417 13.7071 0.292893C13.3166 -0.0976311 12.6834 -0.0976311 12.2929 0.292893L7 5.58579L1.70711 0.292893C1.31658 -0.0976311 0.683417 -0.0976311 0.292893 0.292893C-0.0976311 0.683417 -0.0976311 1.31658 0.292893 1.70711L5.58579 7L0.292893 12.2929C-0.0976311 12.6834 -0.0976311 13.3166 0.292893 13.7071C0.683417 14.0976 1.31658 14.0976 1.70711 13.7071L7 8.41421L12.2929 13.7071C12.6834 14.0976 13.3166 14.0976 13.7071 13.7071C14.0976 13.3166 14.0976 12.6834 13.7071 12.2929L8.41421 7L13.7071 1.70711Z" fill="black"></path>
		              	</svg>
                                </div>
                                <div class="details-modal-title">
                                    <h1>Cadastrar Aluno</h1>
                                </div>
                                <div class="details-modal-content">
                                    <form id="formulario" action="CadastrarAluno" method="post" class="login-form">
                                        <label for="nome_Aluno">Nome*</label>
                                        <input type="text" id="nome_Aluno" name="nome_Aluno" class="form-control-material">
                                        <label for="cpf_Aluno">CPF</label>
                                        <input type="text" id="cpf_Aluno" name="cpf_Aluno" class="form-control-material">
                                        <label for="email_Aluno">Email*</label>
                                        <input type="text" id="email_Aluno" name="email_Aluno" class="form-control-material">
                                        <label for="registro_Aluno">Registro Aluno*</label>
                                        <input type="text" id="registro_Aluno" name="registro_Aluno" class="form-control-material">
                                        <label for="data_nascimento_Aluno">Data de Nascimento*</label>
                                        <input type="text" id="data_nascimento_Aluno" name="data_nascimento_Aluno" class="form-control-material">
                                        <label for="logradouro_Aluno">Logradouro*</label>
                                        <input type="text" id="logradouro_Aluno" name="logradouro_Aluno" class="form-control-material">
                                        <label for="bairro_Aluno">Bairro*</label>
                                        <input type="text" id="bairro_Aluno" name="bairro_Aluno" class="form-control-material">
                                        <label for="cep_Aluno">CEP*</label>
                                        <input type="text" id="cep_Aluno" name="cep_Aluno" class="form-control-material">
                                        <label for="nome_cidade_Aluno">Cidade*</label>
                                        <input type="text" id="nome_cidade_Aluno" name="nome_cidade_Aluno" class="form-control-material">
                                        <label for="sigla_estado_Aluno">Estado*</label>
                                        <input type="text" id="sigla_estado_Aluno" name="sigla_estado_Aluno" class="form-control-material">
                                        <label for="id_Curso">Curso*</label>
                                        <select id="id_Curso" name="id_Curso" class="form-control-material">
			            		<c:forEach items="${lista_cursos}" var="item">
									<option value="${item.id}">${item.nome_curso}</option>
								</c:forEach>
			            	</select>
                                        <input type="submit" id="operacao" name="operacao" value="SALVAR" class="btn-form">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <table class="products-area-wrapper tableView" id="tabela-itens">
                            <c:choose>
                                <c:when test="${alunos != null && alunos.operacao == 'CONSULTAR'}">
                                    <c:choose>
                                        <c:when test="${alunos.dados.size() > 0}">
                                            <c:forEach items="${alunos.dados}" var="item">
                                                <tr class="products-row">
                                                    <td class="product-cell id_aluno">${item.id}</td>
                                                    <td class="product-cell nome_aluno">
                                                        <span>${item.nome}</span>
                                                    </td>
                                                    <td class="product-cell cpf_aluno">
                                                        <span class="status active">${item.cpf}</span>
                                                    </td>
                                                    <td class="product-cell email_aluno">${item.email}</td>
                                                    <td class="product-cell data_nascimento_aluno">${item.dta_nascimento}</td>
                                                    <td class="product-cell registro_aluno">${item.registro_aluno}</td>
                                                    <td class="product-cell endereco_aluno">${item.endereco}</td>
                                                    <td class="product-cell endereco_aluno">${item.curso.nome_curso}</td>
                                                    <td class="product-cell botoes_aluno">
                                                        <div class="modal-form closed" id="modal-form_${item.id}">
                                                            <div class="details-modal-overlay" onclick="this.parentNode.classList.toggle('closed')"></div>
                                                            <div class="details-modal">
                                                                <div class="details-modal-close" id="fechar-modal-form">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
									                	<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7071 1.70711C14.0976 1.31658 14.0976 0.683417 13.7071 0.292893C13.3166 -0.0976311 12.6834 -0.0976311 12.2929 0.292893L7 5.58579L1.70711 0.292893C1.31658 -0.0976311 0.683417 -0.0976311 0.292893 0.292893C-0.0976311 0.683417 -0.0976311 1.31658 0.292893 1.70711L5.58579 7L0.292893 12.2929C-0.0976311 12.6834 -0.0976311 13.3166 0.292893 13.7071C0.683417 14.0976 1.31658 14.0976 1.70711 13.7071L7 8.41421L12.2929 13.7071C12.6834 14.0976 13.3166 14.0976 13.7071 13.7071C14.0976 13.3166 14.0976 12.6834 13.7071 12.2929L8.41421 7L13.7071 1.70711Z" fill="black"></path>
									              	</svg>
                                                                </div>
                                                                <div class="details-modal-title">
                                                                    <h1>Alterar Aluno</h1>
                                                                </div>
                                                                <div class="details-modal-content">
                                                                    <form id="formulario_${item.id}" action="AlterarAluno" method="post" class="login-form">
                                                                        <label for="id_Aluno">ID (n�o � poss�vel alterar)</label>
                                                                        <input type="text" id="id_Aluno" name="id_Aluno" class="form-control-material" value="${item.id}" readonly/>
                                                                        <label for="nome_Aluno">Nome*</label>
                                                                        <input type="text" id="nome_Aluno" name="nome_Aluno" class="form-control-material" value="${item.nome}">
                                                                        <label for="cpf_Aluno">CPF (n�o � poss�vel alterar)</label>
                                                                        <input type="text" id="cpf_Aluno" name="cpf_Aluno" class="form-control-material" value="${item.cpf}" readonly>
                                                                        <label for="email_Aluno">Email*</label>
                                                                        <input type="text" id="email_Aluno" name="email_Aluno" class="form-control-material">
                                                                        <label for="registro_Aluno">Registro Aluno*</label>
                                                                        <input type="text" id="registro_Aluno" name="registro_Aluno" class="form-control-material" value="${item.registro_aluno}" readonly>
                                                                        <label for="data_nascimento_Aluno">Data de Nascimento*</label>
                                                                        <input type="text" id="data_nascimento_Aluno" name="data_nascimento_Aluno" class="form-control-material">
                                                                        <label for="logradouro_Aluno">Logradouro*</label>
                                                                        <input type="text" id="logradouro_Aluno" name="logradouro_Aluno" class="form-control-material">
                                                                        <label for="bairro_Aluno">Bairro*</label>
                                                                        <input type="text" id="bairro_Aluno" name="bairro_Aluno" class="form-control-material">
                                                                        <label for="cep_Aluno">CEP*</label>
                                                                        <input type="text" id="cep_Aluno" name="cep_Aluno" class="form-control-material">
                                                                        <label for="nome_cidade_Aluno">Cidade*</label>
                                                                        <input type="text" id="nome_cidade_Aluno" name="nome_cidade_Aluno" class="form-control-material">
                                                                        <label for="sigla_estado_Aluno">Estado*</label>
                                                                        <input type="text" id="sigla_estado_Aluno" name="sigla_estado_Aluno" class="form-control-material">
                                                                        <label for="id_Curso">Curso*</label>
                                                                        <select id="id_Curso" name="id_Curso" class="form-control-material">
										            		<c:forEach items="${lista_cursos}" var="curso">
																<option value="${curso.id}">${curso.nome_curso}</option>
															</c:forEach>
										            	</select>
                                                                        <input type="submit" id="operacao" name="operacao" value="ALTERAR" class="btn-form">
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button class="action-button" onclick="abreFormularioAlterar('${item.id}')">Alterar</button>
                                                        <button class="action-button excluir" form="formulario_${item.id}" formaction="ExcluirAluno" type="submit" id="operacao" name="operacao" value="EXCLUIR">Excluir</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>N�o h� alunos cadastrados ou o par�metro utilizado n�o retornou nenhum resultado.</p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <p>Clique no campo pesquisar e aperte ENTER para realizar a pesquisa de todos os alunos cadastrados.</p>
                                </c:otherwise>
                            </c:choose>
                        </table>
                    </div>
                </div>
            </body>
            <script src="static/js/index.js"></script>
            <script type="text/javascript">
                class TabelaHeader {
                    constructor(array_nomes_atributos) {
                        this.array_nomes_atributos = array_nomes_atributos;
                    }

                    setHeaderTabela() {
                        let html = this.array_nomes_atributos.reduce((acc, cur) => {
                            return acc + '<th class="product-cell">' + cur + '</th>';
                        }, "");
                        return '<thead><tr class="products-header">' + html + '<th class="product-cell"></th></tr></thead>';
                    }
                }

                const tabela = document.querySelector('#tabela-itens');
                htmlAluno = new TabelaHeader(['ID', 'Nome', 'CPF', 'Email', 'Data Nascimento', 'Registro Aluno', 'Endere�o', 'Curso']).setHeaderTabela();
                tabela.insertAdjacentHTML('afterbegin', htmlAluno);

                const abreFormularioAlterar = (id) => {
                    document.querySelector('#modal-form_' + id).classList.remove('closed');
                }
            </script>
            </body>

            </html>
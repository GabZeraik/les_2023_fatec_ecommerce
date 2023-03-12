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
                            <li class="sidebar-list-item active" id="link-menu-Curso" onclick="alterarElementos(this)">
                                <a href="cursos.jsp">
                                    <span class="icon-item-sidebar">&#128218;</span>
                                    <span>Cursos</span>
                                </a>
                            </li>
                            <li class="sidebar-list-item" id="link-menu-Aluno">
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
                        <table class="products-area-wrapper tableView" id="tabela-itens">
                            <c:choose>
                                <c:when test="${cursos != null && cursos.operacao == 'CONSULTAR'}">
                                    <c:choose>
                                        <c:when test="${cursos.dados.size() > 0}">
                                            <c:forEach items="${cursos.dados}" var="item">
                                                <tr class="products-row">
                                                    <td class="product-cell id_curso">${item.id}</td>
                                                    <td class="product-cell nome_curso">
                                                        <span>${item.nome_curso}</span>
                                                    </td>
                                                    <td class="product-cell descricao_curso">
                                                        <span class="status active">${item.descricao}</span>
                                                    </td>
                                                    <td class="product-cell periodo_curso">${item.periodo}</td>
                                                    <td class="product-cell data_cadastro_curso">
                                                        <fmt:formatDate pattern="dd-MM-yyyy" value="${item.dta_cadastro.getTime()}" />
                                                    </td>
                                                    <td class="product-cell botoes_curso">
                                                        <div class="modal-form closed" id="modal-form_${item.id}">
                                                            <div class="details-modal-overlay" onclick="this.parentNode.classList.toggle('closed')"></div>
                                                            <div class="details-modal">
                                                                <div class="details-modal-close" id="fechar-modal-form">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
									                	<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7071 1.70711C14.0976 1.31658 14.0976 0.683417 13.7071 0.292893C13.3166 -0.0976311 12.6834 -0.0976311 12.2929 0.292893L7 5.58579L1.70711 0.292893C1.31658 -0.0976311 0.683417 -0.0976311 0.292893 0.292893C-0.0976311 0.683417 -0.0976311 1.31658 0.292893 1.70711L5.58579 7L0.292893 12.2929C-0.0976311 12.6834 -0.0976311 13.3166 0.292893 13.7071C0.683417 14.0976 1.31658 14.0976 1.70711 13.7071L7 8.41421L12.2929 13.7071C12.6834 14.0976 13.3166 14.0976 13.7071 13.7071C14.0976 13.3166 14.0976 12.6834 13.7071 12.2929L8.41421 7L13.7071 1.70711Z" fill="black"></path>
									              	</svg>
                                                                </div>
                                                                <div class="details-modal-title">
                                                                    <h1>Alterar Curso</h1>
                                                                </div>
                                                                <div class="details-modal-content">
                                                                    <form id="formulario_${item.id}" action="AlterarCurso" method="post" class="login-form">
                                                                        <label for="id_Curso">ID</label>
                                                                        <input type="text" id="id_Curso" name="id_Curso" class="form-control-material" value="${item.id}" readonly/>
                                                                        <label for="nome_Curso">Nome*</label>
                                                                        <input type="text" id="nome_Curso" name="nome_Curso" class="form-control-material" value="" />
                                                                        <label for="descricao_Curso">Descri��o*</label>
                                                                        <input type="text" id="descricao_Curso" name="descricao_Curso" class="form-control-material" value="" />
                                                                        <label for="periodo_Curso">Per�odo*</label>
                                                                        <input type="text" id="periodo_Curso" name="periodo_Curso" class="form-control-material" value="" />
                                                                        <input type="submit" id="operacao" name="operacao" value="ALTERAR" class="btn-form">
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button class="action-button" onclick="abreFormularioAlterar('${item.id}')">Alterar</button>
                                                        <button class="action-button excluir" form="formulario_${item.id}" formaction="ExcluirCurso" type="submit" id="operacao" name="operacao" value="EXCLUIR">Excluir</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>N�o h� cursos cadastrados ou o par�metro utilizado n�o retornou nenhum resultado !</p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <p>Clique no campo pesquisar e aperte ENTER para realizar a pesquisa de todos os cursos cadastrados!</p>
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
                htmlCurso = new TabelaHeader(['ID', 'Nome', 'Descri��o', 'Per�odo', 'Data Cadastro']).setHeaderTabela();
                tabela.insertAdjacentHTML('afterbegin', htmlCurso);
            </script>
            <script type="text/javascript">
                const abreFormularioAlterar = (id) => {
                    document.querySelector('#modal-form_' + id).classList.remove('closed');
                }
            </script>
            </body>

            </html>
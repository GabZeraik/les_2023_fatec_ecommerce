<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/styles.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <title>Gestão Acadêmica</title>
</head>

<body>
    <div class="app-container">
        <div class="sidebar">
            <div class="sidebar-header">
                <div class="app-icon">
                    <span class="icon-principal">&#128214</span>
                </div>
                <span>Gestão Acadêmica</span>
                <span>ESIII - 2022</span>
            </div>
            <ul class="sidebar-list">
                <li class="sidebar-list-item active" id="link-menu-home">
                    <a href="">
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
                <li class="sidebar-list-item" id="link-menu-Aluno">
                	<a onclick="document.querySelector('#btn-alunos').click()">
	                	<form id="AlunosRedirect" action="ConsultarCursosAlunos" method="post">
							<input type="hidden" class="search-bar escondido" type="text" name="allItems" value="0">
							<span class="icon-item-sidebar">&#127891;</span>
	                       	<span>Alunos</span>
	                       	<button id="btn-alunos" class="escondido" form="AlunosRedirect" type="submit" id="operacao" name="operacao" value="CONSULTAR"></button>
						</form>
                	</a>
                </li>
                <li class="sidebar-list-item" id="link-menu-Professor">
                    <a onclick="document.querySelector('#btn-professores').click()">
	                	<form id="ProfessoresRedirect" action="ConsultarCursosProfessores" method="post">
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
            <c:choose>
                <c:when test="${resultado.sucesso == true && resultado != null}">
                    <div class="mensagem-sucesso">
                        <p>${resultado.mensagem}</p>
                    </div>
                </c:when>
                <c:when test="${resultado.sucesso == false && resultado != null}">
                    <div class="mensagem-erro">
                        <p>${resultado.mensagem}</p>
                    </div>
                </c:when>
            </c:choose>
            
        </div>
    </div>
    
    <script src="static/js/index.js"></script>
</body>
</html>
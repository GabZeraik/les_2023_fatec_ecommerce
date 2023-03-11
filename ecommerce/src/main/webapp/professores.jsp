<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                <li class="sidebar-list-item active" id="link-menu-Professor">
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
        		<c:when test="${lista_cursos != null && lista_cursos.size() > 0 && cadastrar == true}">
        			<div class="modal-form" id="modal-form">
        		</c:when>
        		<c:otherwise>
        			<div class="modal-form closed" id="modal-form">
        		</c:otherwise>
        	</c:choose>
				<div class="details-modal-overlay" onclick="this.parentNode.classList.toggle('closed')"></div>
       			<div class="details-modal">
		            <div class="details-modal-close" id="fechar-modal-form">
		                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
		                	<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7071 1.70711C14.0976 1.31658 14.0976 0.683417 13.7071 0.292893C13.3166 -0.0976311 12.6834 -0.0976311 12.2929 0.292893L7 5.58579L1.70711 0.292893C1.31658 -0.0976311 0.683417 -0.0976311 0.292893 0.292893C-0.0976311 0.683417 -0.0976311 1.31658 0.292893 1.70711L5.58579 7L0.292893 12.2929C-0.0976311 12.6834 -0.0976311 13.3166 0.292893 13.7071C0.683417 14.0976 1.31658 14.0976 1.70711 13.7071L7 8.41421L12.2929 13.7071C12.6834 14.0976 13.3166 14.0976 13.7071 13.7071C14.0976 13.3166 14.0976 12.6834 13.7071 12.2929L8.41421 7L13.7071 1.70711Z" fill="black"></path>
		              	</svg>
		            </div>
	     			<div class="details-modal-title">
	         			<h1>Cadastrar Professor</h1>
	     			</div>
	        		<div class="details-modal-content">
			            <form id="formulario" action="CadastrarProfessor" method="post" class="login-form">
			            	<label for="nome_Professor">Nome*</label>
                    		<input type="text" id="nome_Professor" name="nome_Professor" class="form-control-material">
			            	<label for="cpf_Professor">CPF*</label>
                    		<input type="text" id="cpf_Professor" name="cpf_Professor" class="form-control-material">
			            	<label for="email_Professor">Email*</label>
			            	<input type="text" id="email_Professor" name="email_Professor" class="form-control-material">
			            	<label for="registro_Professor">Registro Professor*</label>
		                    <input type="text" id="registro_Professor" name="registro_Professor" class="form-control-material">
			            	<label for="logradouro_Professor">Logradouro*</label>
                    		<input type="text" id="logradouro_Professor" name="logradouro_Professor" class="form-control-material">
			            	<label for="bairro_Professor">Bairro*</label>
		                    <input type="text" id="bairro_Professor" name="bairro_Professor" class="form-control-material">
		                    <label for="cep_Professor">CEP*</label>
		                    <input type="text" id="cep_Professor" name="cep_Professor" class="form-control-material">
		                    <label for="cidade_Professor">Cidade*</label>
		                    <input type="text" id="cidade_Professor" name="cidade_Professor" class="form-control-material">
		                    <label for="sigla_estado_Professor">Estado*</label>
		                    <input type="text" id="sigla_estado_Professor" name="sigla_estado_Professor" class="form-control-material">
			            	<label for="curso_1_Professor">Curso 1*</label>
			            	<select id="curso_1_Professor" name="curso_1_Professor" class="form-control-material">
			            		<c:forEach items="${lista_cursos}" var="item">
									<option value="${item.id}">${item.nome_curso}</option>
								</c:forEach>
			            	</select>
			            	<label for="curso_2_Professor">Curso 2 (opcional)</label>
			            	<select id="curso_2_Professor" name="curso_2_Professor" class="form-control-material" value="">
			            		<option value="0" selected>Opcional</option>
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
				  <c:when test="${professores != null && professores.operacao == 'CONSULTAR'}">
					  <c:choose>
						  <c:when test="${professores.dados.size() > 0}">
							<c:forEach items="${professores.dados}" var="item">
								<tr class="products-row">
							        <td class="product-cell id_professor">${item.id}</td>
							        <td class="product-cell nome_professor">
							            <span>${item.nome}</span>
							        </td>
							        <td class="product-cell cpf_professor">
							            <span class="status active">${item.cpf}</span>
							        </td>
							        <td class="product-cell email_professor">${item.email}</td>
							        <td class="product-cell registro_professor">${item.registro_professor}</td>
							        <td class="product-cell endereco_professor">${item.endereco}</td>
									<td class="product-cell cursos_1_professor">${item.cursos.get(0).nome_curso}</td>
							        <td class="product-cell cursos_2_professor">${item.cursos.get(1).nome_curso}</td>
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
					                				<h1>Alterar Professor</h1>
					            				</div>
				            					<div class="details-modal-content">
										            <form id="formulario_${item.id}" action="AlterarProfessor" method="post" class="login-form">
										            	<label for="id_Professor" >ID (não é possível alterar)</label>
										            	<input type="text" id="id_Professor" name="id_Professor" class="form-control-material" value="${item.id}" readonly/>
										            	<label for="nome_Professor">Nome*</label>
							                    		<input type="text" id="nome_Professor" name="nome_Professor" class="form-control-material">
										            	<label for="cpf_Professor">CPF*</label>
							                    		<input type="text" id="cpf_Professor" name="cpf_Professor" class="form-control-material">
										            	<label for="email_Professor">Email*</label>
							                    		<input type="text" id="email_Professor" name="email_Professor" class="form-control-material">
										            	<label for="registro_Professor">Registro Professor*</label>
		                    							<input type="text" id="registro_Professor" name="registro_Professor" class="form-control-material">
										            	<label for="logradouro_Professor">Logradouro*</label>
							                    		<input type="text" id="logradouro_Professor" name="logradouro_Professor" class="form-control-material">
										            	<label for="bairro_Professor">Bairro*</label>
									                    <input type="text" id="bairro_Professor" name="bairro_Professor" class="form-control-material">
									                    <label for="cep_Professor">CEP*</label>
									                    <input type="text" id="cep_Professor" name="cep_Professor" class="form-control-material">
									                    <label for="cidade_Professor">Cidade*</label>
									                    <input type="text" id="cidade_Professor" name="cidade_Professor" class="form-control-material">
									                    <label for="sigla_estado_Professor">Estado*</label>
									                    <input type="text" id="sigla_estado_Professor" name="sigla_estado_Professor" class="form-control-material">
										            	<label for="curso_1_Professor">Curso 1*</label>
										            	<select id="curso_1_Professor" name="curso_1_Professor" class="form-control-material">
										            		<c:forEach items="${lista_cursos}" var="curso1">
																<option value="${curso1.id}">${curso1.nome_curso}</option>
															</c:forEach>
										            	</select>
										            	<label for="curso_2_Professor">Curso 2</label>
										            	<select id="curso_2_Professor" name="curso_2_Professor" class="form-control-material">
										            		<option value="0" selected>Opcional</option>
										            		<c:forEach items="${lista_cursos}" var="curso2">
																<option value="${curso2.id}">${curso2.nome_curso}</option>
															</c:forEach>
										            	</select>
									            		<input type="submit" id="operacao" name="operacao" value="ALTERAR" class="btn-form">
								            		</form>
								            	</div>
								        	</div>
		            					</div>
		            					<button class="action-button" onclick="abreFormularioAlterar('${item.id}')">Alterar</button>
		        						<button class="action-button excluir" form="formulario_${item.id}" formaction="ExcluirProfessor" type="submit" id="operacao" name="operacao" value="EXCLUIR">Excluir</button>
						        	</td>
							    </tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
					     		<p>Não há professores cadastrados ou o parâmetro utilizado não retornou nenhum resultado.</p>
					  		</c:otherwise>
				  		</c:choose>
				  </c:when>
				  <c:otherwise>
				     <p>Clique no campo pesquisar e aperte ENTER para realizar a pesquisa de todos os professores cadastrados.</p>
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
	    	let html = this.array_nomes_atributos.reduce((acc, cur)=>{
	            return acc + '<th class="product-cell">' + cur + '</th>';
	        }, "");
	            return '<thead><tr class="products-header">' + html + '<th class="product-cell"></th></tr></thead>';
	    }
	}
	
	const tabela = document.querySelector('#tabela-itens');
    htmlProfessor = new TabelaHeader(['ID', 'Nome', 'CPF', 'Email', 'Registro Professor', 'Endereço', 'Curso 1', 'Curso 2']).setHeaderTabela();
    tabela.insertAdjacentHTML('afterbegin', htmlProfessor);
    
    const abreFormularioAlterar = (id)=>{
		document.querySelector('#modal-form_' + id).classList.remove('closed');
	}
</script>
</body>

</html>
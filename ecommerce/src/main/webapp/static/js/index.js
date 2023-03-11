class Formulario {
    constructor(entidade, array_obj_campos) {
        this.entidade = entidade
        this.array_obj_campos = array_obj_campos;
    }

    setFormularioVazio() {
            return `<div class="modal-form closed" id="modal-form">
        <div class="details-modal-overlay" onclick="this.parentNode.classList.toggle('closed')"></div>
        <div class="details-modal">
            <div class="details-modal-close" id="fechar-modal-form">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13.7071 1.70711C14.0976 1.31658 14.0976 0.683417 13.7071 0.292893C13.3166 -0.0976311 12.6834 -0.0976311 12.2929 0.292893L7 5.58579L1.70711 0.292893C1.31658 -0.0976311 0.683417 -0.0976311 0.292893 0.292893C-0.0976311 0.683417 -0.0976311 1.31658 0.292893 1.70711L5.58579 7L0.292893 12.2929C-0.0976311 12.6834 -0.0976311 13.3166 0.292893 13.7071C0.683417 14.0976 1.31658 14.0976 1.70711 13.7071L7 8.41421L12.2929 13.7071C12.6834 14.0976 13.3166 14.0976 13.7071 13.7071C14.0976 13.3166 14.0976 12.6834 13.7071 12.2929L8.41421 7L13.7071 1.70711Z" fill="black" />
              </svg>
            </div>
            <div class="details-modal-title">
                <h1>Cadastrar ${this.entidade}</h1>
            </div>
            <div class="details-modal-content">
                <form action="Cadastrar${this.entidade}" method="post" class="login-form">
                    ${this.array_obj_campos.reduce((acc, cur)=>{
                        if (cur.tag_elemento == 'select'){
                            return acc + `<div>
                                <label for="${cur['nome']}_${this.entidade}">${cur.nome_display}</label>
                                <select id="${cur['nome']}_${this.entidade}" name="${cur['nome']}_${this.entidade}" class="form-control-material"/></select>
                            </div>`;
                        }                        
                        return acc + `<div>
                            <label for="${cur['nome']}_${this.entidade}">${cur.nome_display}</label>
                            <input type="text" id="${cur['nome']}_${this.entidade}" name="${cur['nome']}_${this.entidade}" class="form-control-material"/>
                        </div>`;
                    }, "")}
                    <input type="hidden" id="id_${this.entidade}" name="id_${this.entidade} value="0">
                    <div class="div-form-btn">
                        <input type="submit" id="operacao" name="operacao" value="SALVAR" type="submit" class="btn-form" />
                    </div>
                </form>
            </div>
        </div>
    </div>`
    }
}

class TabelaLinhaItemCurso {
    constructor(id_curso, nome_curso, descricao_curso, periodo_curso, dta_cadastro) {
        this.id_curso = id_curso;
        this.nome_curso = nome_curso;
        this.descricao_curso = descricao_curso;
        this.periodo_curso = periodo_curso;
        this.dta_cadastro = dta_cadastro;
    }

    setLinhaItem() {
        return `<tr class="products-row">
        <td class="product-cell id_curso">${this.id_curso}</td>
        <td class="product-cell nome_curso">
            <span>${this.nome_curso}</span>
        </td>
        <td class="product-cell descricao_curso">
            <span class="status active">${this.descricao_curso}</span>
        </td>
        <td class="product-cell periodo_curso">${this.periodo_curso}</td>
        <td class="product-cell data_cadastro_curso">${this.dta_cadastro}</td>
        <td class="product-cell botoes_curso">
            <button class="action-button">Alterar</button>
            <button class="action-button excluir">Excluir</button>
        </td>
    </tr>`;
    }
    
    appendLinha(){
		document.querySelector('#tabela-itens').insertAdjacentHTML('beforeend', this.setLinhaItem())
	}
}

class SiteHeader{
    constructor(tituloHeader, array_nomes_atributos){
        this.tituloHeader = tituloHeader;
        this.array_nomes_atributos = array_nomes_atributos;
    }

    setSiteHeader(){
        return `<div class="app-content-header">
                <h1 class="app-content-headerText">${this.tituloHeader}</h1>
                <button class="app-content-headerButton" id="botao-adicionar" onclick="eventoBotaoCadastrar()">Adicionar ${this.tituloHeader}</button>
            </div>
            <div class="app-content-actions">
            	<form action="Consultar${this.tituloHeader}" method="get">
            		${this.array_nomes_atributos.reduce((acc, cur)=>{
						if (cur.split("_")[0] == "id") return acc + `<input class="search-bar escondido" type="text" name="${cur}" value="0">`
			            return acc + `<input class="search-bar" placeholder="Pesquisar por ${cur.split("_")[0]}..." type="text" name="${cur}" value="">`;
			        }, "")}
            	
            	<input class="escondido" type="submit" id="operacao" name="operacao" value="CONSULTAR" type="submit" class="btn-form"/>
                </form>
            </div>`
    }
}

class Tabela{
    setTabela(){
        return `<table class="products-area-wrapper tableView" id="tabela-itens"></table>`
    }
}

const appContent = document.querySelector('#site-container');

const eventoBotaoCadastrar = ()=>{		
	try {
        document.querySelector('#modal-form').classList.toggle('closed')
    } catch (error) {}    
	   
}

const alterarElementos = (element)=>{
	// if(typeof element == 'Curso') return montaHtmlCurso(appContent);
	// if(typeof element == 'Professor') return montaHtmlProfessor(appContent);
	// if(typeof element == 'Aluno') return montaHtmlALuno(appContent);
	
	Array.from(element.parentNode.children).forEach(element => {
        if(element.classList.contains('active')) element.classList.remove('active');
    });
    element.classList.add('active');
    appContent.innerHTML = '';
    if(element.id.includes("Curso")) return montaHtmlCurso(appContent);
    if(element.id.includes("Professor")) return montaHtmlProfessor(appContent);
    if(element.id.includes("Aluno")) return montaHtmlALuno(appContent);
    return montaHtmlHome(appContent);
}

const montaHtmlHome = (siteContainer)=>{
	const itemMenuAtivo = document.querySelector('.active').id.split("link-menu-")[1];
	if(itemMenuAtivo == "Curso") return montaHtmlCurso(siteContainer);
	if(itemMenuAtivo == "Aluno") return montaHtmlALuno(siteContainer);
	if(itemMenuAtivo == "Professor") return montaHtmlProfessor(siteContainer);
    siteContainer.insertAdjacentHTML('beforeend','<div class="bem-vindo"><p class="titulo-bem-vindo">Bem vindo ao Gestão Acadêmica</p><p class="titulo-bem-vindo">ESIII - 2022</p></p></div>');
}

const montaHtmlCurso = (siteContainer) => {
    let htmlCurso = new SiteHeader('Curso', ['id_Curso', 'nome_Curso', 'descricao_Curso', 'periodo_Curso']).setSiteHeader();
    siteContainer.insertAdjacentHTML('afterbegin', htmlCurso);

    /*const tabela = document.querySelector('#tabela-itens');
    htmlCurso = new TabelaHeader(['ID', 'Nome', 'Descrição', 'Período', 'Data Cadastro']).setHeaderTabela();
    tabela.insertAdjacentHTML('afterbegin', htmlCurso);*/

    htmlCurso = new Formulario('Curso', [{tag_elemento: 'input', nome_display: 'Nome*', nome: 'nome'}, {tag_elemento: 'input', nome_display: 'Descrição*', nome: 'descricao'}, {tag_elemento: 'input', nome_display: 'Período*', nome: 'periodo'}]).setFormularioVazio();
    siteContainer.insertAdjacentHTML('beforeend', htmlCurso);
}

const montaHtmlALuno = (siteContainer) => {
    let htmlAluno = new SiteHeader('Aluno', ['id_Aluno', 'nome_Aluno', 'cpf_Aluno', 'email_Aluno', 'curso_Aluno', 'id_Curso']).setSiteHeader();
    siteContainer.insertAdjacentHTML('afterbegin', htmlAluno);

    // const tabela = document.querySelector('#tabela-itens');
    // htmlCurso = new TabelaHeader(['ID', 'Nome', 'CPF', 'Email', 'Data Nascimento', 'Registro Aluno', 'Endereço', 'Curso']).setHeaderTabela();
    // tabela.insertAdjacentHTML('afterbegin', htmlCurso);
    
    //htmlAluno = new Formulario('Aluno', [{tag_elemento: 'input', nome_display: 'Nome*', nome: 'nome'}, {tag_elemento: 'input', nome_display: 'CPF*', nome: 'cpf'}, {tag_elemento: 'input', nome_display: 'Email*', nome: 'email'}, {tag_elemento: 'input', nome_display: 'Data de Nascimento*', nome: 'data_nascimento'}, {tag_elemento: 'input', nome_display: 'Logradouro*', nome: 'logradouro'}, {tag_elemento: 'input', nome_display: 'Bairro*', nome: 'bairro'}, {tag_elemento: 'input', nome_display: 'CEP*', nome: 'cep'}, {tag_elemento: 'input', nome_display: 'Cidade*', nome: 'cidade'}, {tag_elemento: 'input', nome_display: 'Estado*', nome: 'estado'}, {tag_elemento: 'select', nome_display: 'Curso*', nome: 'curso'}]).setFormularioVazio();
    //siteContainer.insertAdjacentHTML('beforeend', htmlAluno);
}

const montaHtmlProfessor = (siteContainer) => {
    let htmlProfessor = new SiteHeader('Professor', ['id_Professor', 'nome_Professor', 'cpf_Professor', 'email_Professor', 'curso_Professor']).setSiteHeader();
    siteContainer.insertAdjacentHTML('afterbegin', htmlProfessor);

    /*const tabela = document.querySelector('#tabela-itens');
    htmlProfessor = new TabelaHeader(['ID', 'Nome', 'CPF', 'Email', 'Registro Professor', 'Endereço', 'Curso']).setHeaderTabela();
    tabela.insertAdjacentHTML('afterbegin', htmlProfessor);*/

    //htmlProfessor = new Formulario('Professor', [{tag_elemento: 'input', nome_display: 'Nome*', nome: "nome"}, {tag_elemento: 'input', nome_display: 'CPF*', nome: "cpf"}, {tag_elemento: 'input', nome_display: 'Email*', nome: "email"}, {tag_elemento: 'input', nome_display: 'Logradouro*', nome: "logradouro"}, {tag_elemento: 'input', nome_display: 'Bairro*', nome: "bairro"}, {tag_elemento: 'input', nome_display: 'CEP*', nome: "cep"}, {tag_elemento: 'input', nome_display: 'Cidade*', nome: "cidade"}, {tag_elemento: 'input', nome_display: 'Estado*', nome: "estado"}, {tag_elemento: 'select', nome_display: 'Curso*', nome: "Curso"}]).setFormularioVazio();
    //siteContainer.insertAdjacentHTML('beforeend', htmlProfessor);
}

const adicionaEventoBotaoPesquisar = ()=>{
	document.querySelector('.icon-principal').addEventListener('click')
}

montaHtmlHome(appContent);
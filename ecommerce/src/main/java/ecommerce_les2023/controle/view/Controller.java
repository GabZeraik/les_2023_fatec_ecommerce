package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ExcluirCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.controle.SalvarCommand;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class Controller extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static Map<String, ICommand> mapCommands;
	private static Map<String, IViewHelper> mapViewHelpers;
	
	public Controller() {
		super();
		//Instancia e cria todos os commands no atributo Map para chamar posteriormente através da url
		mapCommands = new HashMap<String, ICommand>();
		mapCommands.put("SALVAR", new SalvarCommand());
		mapCommands.put("ALTERAR", new AlterarCommand());
		mapCommands.put("EXCLUIR", new ExcluirCommand());
		mapCommands.put("CONSULTAR", new ConsultarCommand());
		
		//Instancia e cria todos os commands no atributo Map para chamar posteriormente através da url
		mapViewHelpers = new HashMap<String, IViewHelper>();
		mapViewHelpers.put("/gestao_academica/CadastrarCurso", new CursoViewHelper());
		mapViewHelpers.put("/gestao_academica/ConsultarCurso", new CursoViewHelper());
		mapViewHelpers.put("/gestao_academica/ExcluirCurso", new CursoViewHelper());
		mapViewHelpers.put("/gestao_academica/AlterarCurso", new CursoViewHelper());
		
		mapViewHelpers.put("/gestao_academica/CadastrarAluno", new AlunoViewHelper());
		mapViewHelpers.put("/gestao_academica/ConsultarAluno", new AlunoViewHelper());
		mapViewHelpers.put("/gestao_academica/AlterarAluno", new AlunoViewHelper());
		mapViewHelpers.put("/gestao_academica/ExcluirAluno", new AlunoViewHelper());
		//View helper para obter lista de todos os cursos e aplicar na view alunos
		mapViewHelpers.put("/gestao_academica/ConsultarCursosAlunos", new CursosAlunosViewHelper());
		
		mapViewHelpers.put("/gestao_academica/CadastrarProfessor", new ProfessorViewHelper());
		mapViewHelpers.put("/gestao_academica/ConsultarProfessor", new ProfessorViewHelper());
		mapViewHelpers.put("/gestao_academica/AlterarProfessor", new ProfessorViewHelper());
		mapViewHelpers.put("/gestao_academica/ExcluirProfessor", new ProfessorViewHelper());
		//View helper para obter lista de todos os cursos e aplicar na view professores
		mapViewHelpers.put("/gestao_academica/ConsultarCursosProfessores", new CursosProfessoresViewHelper());
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Obtém a operação realizada, como parametro da requisição
		String operacaoForm = req.getParameter("operacao");
		
		//Obtém a uri que deu origem a requisição
		String uriDeOrigem = req.getRequestURI();
		
		//Obtém a view específica mapeada para a uri(chave do map)
		IViewHelper viewHelperRequisitada = mapViewHelpers.get(uriDeOrigem);
		
		//Cria entidade da viewHelper específica
		EntidadeDominio entidade = viewHelperRequisitada.obterEntidade(req);
				
		//Obtém o command específico de acordo com o parametro (tipo) operacao do form
		ICommand commandRequisitado = mapCommands.get(operacaoForm);
		
		//Executa o command passando o objeto (entidade) para realizar a operacao
		Resultado resultado = commandRequisitado.execute(entidade);
				
		viewHelperRequisitada.setView(resultado, req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Obtém a operação realizada, como parametro da requisição
		String operacaoForm = req.getParameter("operacao");
		
		//Obtém a uri que deu origem a requisição
		String uriDeOrigem = req.getRequestURI();
		
		//Obtém a view específica mapeada para a uri(chave do map)
		IViewHelper viewHelperRequisitada = mapViewHelpers.get(uriDeOrigem);
		
		//Cria entidade da viewHelper específica
		EntidadeDominio entidade = viewHelperRequisitada.obterEntidade(req);
				
		//Obtém o command específico de acordo com o parametro (tipo) operacao do form
		ICommand commandRequisitado = mapCommands.get(operacaoForm);
		
		//Executa o command passando o objeto (entidade) para realizar a operacao
		Resultado resultado = commandRequisitado.execute(entidade);
				
		viewHelperRequisitada.setView(resultado, req, resp);
	}
}

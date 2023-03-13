package ecommerce_les2023.controle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ecommerce_les2023.dao.AlunoDAO;
import ecommerce_les2023.dao.ClienteDAO;
import ecommerce_les2023.dao.CursoDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ProfessorDAO;
import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Professor;
import ecommerce_les2023.negocio.IStrategy;
import ecommerce_les2023.negocio.VerificadorDigitosCpfStrategy;
import ecommerce_les2023.negocio.VerificadorEmailCadastradoStrategy;
import ecommerce_les2023.negocio.VerificadorDadosObrigatoriosClienteStrategy;
import ecommerce_les2023.negocio.VerificadorDadosObrigatoriosCursoStrategy;
import ecommerce_les2023.negocio.VerificadorDadosObrigatoriosProfessorStrategy;
import ecommerce_les2023.negocio.VerificadorExistenciaCursoStrategy;
import ecommerce_les2023.negocio.VerificadorRaAlunoStrategy;
import ecommerce_les2023.negocio.VerificadorRfProfessorStrategy;
import ecommerce_les2023.negocio.VerificadorSenhaForte;
import ecommerce_les2023.utils.Resultado;

public class Fachada implements IFachada {
	
	private Map<String, IDAO> mapDaos;
	private Map<String, List<IStrategy>> mapStrategies;

	public Fachada() {
		criarMapStrategies();
		criarMapDaos();
	}
	
	//Cria os mapas de chave/valor para as respectivas classes, linkando a classe com suas regras de negócio
	//Exemplo: classe cliente/ Regra de negócio 01
	private void criarMapStrategies() {
		List<IStrategy> clienteStrategy = new ArrayList<IStrategy>();
		
		//Aplicar regras de negócio para manter clientes
		clienteStrategy.add(new VerificadorDadosObrigatoriosClienteStrategy());
		clienteStrategy.add(new VerificadorDigitosCpfStrategy());
		clienteStrategy.add(new VerificadorSenhaForte());
		
		this.mapStrategies = new HashMap<String, List<IStrategy>>();
		this.mapStrategies.put(Cliente.class.getName(), clienteStrategy);
		
		/*//Aplicar regras de negócio para manter cursos
		cursoStrategies.add(new VerificadorDadosObrigatoriosCursoStrategy());
		cursoStrategies.add(new VerificadorExistenciaCursoStrategy());
		
		//Aplicar regras de negócio para manter professores
		professorStrategies.add(new VerificadorDadosObrigatoriosProfessorStrategy());
		professorStrategies.add(new VerificadorExistenciaCursoStrategy());
		professorStrategies.add(new VerificadorRfProfessorStrategy());
		
		this.mapStrategies = new HashMap<String, List<IStrategy>>();
		this.mapStrategies.put(Aluno.class.getName(), clienteStrategy);
		this.mapStrategies.put(Curso.class.getName(), cursoStrategies);
		this.mapStrategies.put(Professor.class.getName(), professorStrategies);*/
	}

	//Cria os mapas de chave/valor para as respectivas classes, linkando a classe com seu DAO. Exemplo: classe Aluno/ AlunoDAO
	private void criarMapDaos() {
		this.mapDaos = new HashMap<String, IDAO>();
		this.mapDaos.put(Cliente.class.getName(), new ClienteDAO());
	}

	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		Resultado resultado = new Resultado();
		System.out.println(entidade.getClass().getName());
		resultado.setNomeEntidade(entidade.getClass().getName().substring(25));
		resultado.setOperacao("CADASTRAR");
		
		String retornoStrategies = this.executarStrategies(entidade);
		if(retornoStrategies == "" || retornoStrategies == null) {
			mapDaos.get(entidade.getClass().getName()).salvar(entidade);
			List<EntidadeDominio> lista = new ArrayList<>();
			lista.add(entidade);
			resultado.setDados(lista);
			resultado.setMensagem("Cadastro realizado com sucesso!");
			resultado.setSucesso(true);
		}else {
			resultado.setSucesso(false);
			resultado.setMensagem(retornoStrategies);
		} 
		return resultado;	
	}

	@Override
	public Resultado excluir(EntidadeDominio entidade) {
		Resultado resultado = new Resultado();
		resultado.setNomeEntidade(entidade.getClass().getName().substring(25));
		resultado.setOperacao("EXCLUIR");
		mapDaos.get(entidade.getClass().getName()).deletar(entidade);
		List<EntidadeDominio> lista = new ArrayList<>();
		lista.add(entidade);
		resultado.setDados(lista);
		resultado.setMensagem("Cadastro excluído com sucesso!");
		resultado.setSucesso(true);
		
		return resultado;	
	}

	@Override
	public Resultado alterar(EntidadeDominio entidade) {
		Resultado resultado = new Resultado();
		resultado.setNomeEntidade(entidade.getClass().getName().substring(25));
		resultado.setOperacao("ALTERAR");
		
		String retornoStrategies = this.executarStrategies(entidade);
		if(retornoStrategies.isEmpty()) {
			mapDaos.get(entidade.getClass().getName()).alterar(entidade);
			List<EntidadeDominio> lista = new ArrayList<>();
			lista.add(entidade);
			resultado.setDados(lista);
			resultado.setMensagem("Alteração realizada com sucesso!");
			resultado.setSucesso(true);
		}else {
			resultado.setSucesso(false);
			resultado.setMensagem(retornoStrategies);
		} 
		return resultado;	
	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		List<EntidadeDominio> lista = mapDaos.get(entidade.getClass().getName()).consultar(entidade);
		Resultado resultado = new Resultado("Consulta realizada com sucesso", true, "CONSULTAR", entidade.getClass().getName(), lista);  
		return resultado;
	}
	
	//Executa as regras para a classe da entidade passada como parâmetro
	private String executarStrategies(EntidadeDominio entidade) {
		List<IStrategy> strategiesDaClasse = this.mapStrategies.get(entidade.getClass().getName());
		if(strategiesDaClasse != null)
			for(IStrategy strategy : strategiesDaClasse) {
				String erro = strategy.processarStrategy(entidade);
				if(erro != null) return erro;
			}
		return null;
	}
}

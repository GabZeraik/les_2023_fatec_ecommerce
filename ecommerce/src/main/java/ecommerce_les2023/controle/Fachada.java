package ecommerce_les2023.controle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ecommerce_les2023.dao.BandeiraDAO;
import ecommerce_les2023.dao.CarrinhoDAO;
import ecommerce_les2023.dao.CartaoDAO;
import ecommerce_les2023.dao.ClienteDAO;
import ecommerce_les2023.dao.EnderecoDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ItemCarrinhoDAO;
import ecommerce_les2023.dao.ProdutoDAO;
import ecommerce_les2023.modelo.Bandeira;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.Cartao;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.negocio.IStrategy;
import ecommerce_les2023.negocio.VerificadorDigitosCpfStrategy;
import ecommerce_les2023.negocio.VerificadorEmailCadastradoStrategy;
import ecommerce_les2023.negocio.VerificadorDadosObrigatoriosClienteStrategy;
import ecommerce_les2023.negocio.VerificadorDadosObrigatoriosEndereco;
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
		List<IStrategy> cadastrarClienteStrategy = new ArrayList<IStrategy>();
		List<IStrategy> alterarClienteStrategy = new ArrayList<IStrategy>();
		List<IStrategy> cadastrarEnderecoStrategy = new ArrayList<IStrategy>();
		List<IStrategy> cadastrarCartaoStrategy = new ArrayList<IStrategy>();
		
		//Aplicar regras de negócio para manter clientes
		cadastrarClienteStrategy.add(new VerificadorDadosObrigatoriosClienteStrategy());
		cadastrarClienteStrategy.add(new VerificadorDigitosCpfStrategy());
		cadastrarClienteStrategy.add(new VerificadorEmailCadastradoStrategy());
		cadastrarClienteStrategy.add(new VerificadorSenhaForte());
		
		alterarClienteStrategy.add(new VerificadorDigitosCpfStrategy());
		alterarClienteStrategy.add(new VerificadorSenhaForte());
		
		//Aplicar regras de negócio para manter enderecos
		cadastrarEnderecoStrategy.add(new VerificadorDadosObrigatoriosEndereco());
		
		this.mapStrategies = new HashMap<String, List<IStrategy>>();
		
		//Cliente
		this.mapStrategies.put("Cadastrar" + Cliente.class.getName(), cadastrarClienteStrategy);
		this.mapStrategies.put("Alterar" + Cliente.class.getName(), alterarClienteStrategy);

		//Endereco
		this.mapStrategies.put("Cadastrar" + Endereco.class.getName(), cadastrarEnderecoStrategy);
		
		//Cartao
		this.mapStrategies.put("Cadastrar" + Cartao.class.getName(), cadastrarCartaoStrategy);
	}

	//Cria os mapas de chave/valor para as respectivas classes, linkando a classe com seu DAO. Exemplo: classe Aluno/ AlunoDAO
	private void criarMapDaos() {
		this.mapDaos = new HashMap<String, IDAO>();
		this.mapDaos.put(Cliente.class.getName(), new ClienteDAO());
		this.mapDaos.put(Endereco.class.getName(), new EnderecoDAO());
		this.mapDaos.put(Bandeira.class.getName(), new BandeiraDAO());
		this.mapDaos.put(Cartao.class.getName(), new CartaoDAO());
		this.mapDaos.put(Produto.class.getName(), new ProdutoDAO());
		this.mapDaos.put(Carrinho.class.getName(), new CarrinhoDAO());
		this.mapDaos.put(ItemCarrinho.class.getName(), new ItemCarrinhoDAO());
	}

	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		Resultado resultado = new Resultado();
		resultado.setNomeEntidade(entidade.getClass().getName().substring(25));
		resultado.setOperacao("CADASTRAR");
		
		String retornoStrategies = this.executarStrategies(entidade, "Cadastrar");
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
		resultado.objetoToJson();
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
		resultado.objetoToJson();
		return resultado;	
	}

	@Override
	public Resultado alterar(EntidadeDominio entidade) {
		Resultado resultado = new Resultado();
		resultado.setNomeEntidade(entidade.getClass().getName().substring(25));
		resultado.setOperacao("ALTERAR");
		
		String retornoStrategies = this.executarStrategies(entidade, "Alterar");
		if(retornoStrategies == null || retornoStrategies.isEmpty()) {
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
		resultado.objetoToJson();
		return resultado;	
	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		List<EntidadeDominio> lista = mapDaos.get(entidade.getClass().getName()).consultar(entidade);
		Bandeira band = new Bandeira();
		List<EntidadeDominio> bandeiras = mapDaos.get(band.getClass().getName()).consultar(band);
		Resultado resultado = new Resultado("Consulta realizada com sucesso", true, "CONSULTAR", entidade.getClass().getName(), lista, bandeiras);  
		resultado.objetoToJson();
		return resultado;
	}
	
	//Executa as regras para a classe da entidade passada como parâmetro
	private String executarStrategies(EntidadeDominio entidade, String operacao) {
		List<IStrategy> strategiesDaClasse = this.mapStrategies.get(operacao + entidade.getClass().getName());
		if(strategiesDaClasse != null)
			for(IStrategy strategy : strategiesDaClasse) {
				String erro = strategy.processarStrategy(entidade);
				if(erro != null) return erro;
			}
		return null;
	}
}

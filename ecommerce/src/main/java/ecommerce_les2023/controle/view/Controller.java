package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
		mapViewHelpers.put("/ecommerce_les/CadastrarCliente", new ClienteViewHelper());
		mapViewHelpers.put("/ecommerce_les/ConsultarCliente", new ClienteViewHelper());
		mapViewHelpers.put("/ecommerce_les/AlterarClienteParcial", new AlterarClienteParcialViewHelper());
		mapViewHelpers.put("/ecommerce_les/ExcluirCliente", new ClienteViewHelper());
		mapViewHelpers.put("/ecommerce_les/InativarCliente", new InativarClienteViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/EntrarCliente", new EntrarClienteViewHelper());
		mapViewHelpers.put("/ecommerce_les/SairCliente", new SairClienteViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/CadastrarEndereco", new EnderecoViewHelper());
		mapViewHelpers.put("/ecommerce_les/AlterarEndereco", new EnderecoViewHelper());
		mapViewHelpers.put("/ecommerce_les/ExcluirEndereco", new EnderecoViewHelper());
		mapViewHelpers.put("/ecommerce_les/CadastrarEnderecoCheckout", new EnderecoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/CadastrarCartao", new CartaoViewHelper());
		mapViewHelpers.put("/ecommerce_les/AlterarCartao", new CartaoViewHelper());
		mapViewHelpers.put("/ecommerce_les/ExcluirCartao", new CartaoViewHelper());
		mapViewHelpers.put("/ecommerce_les/CadastrarCartaoCheckout", new CartaoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/ConsultarProduto", new ProdutoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/CadastrarItemCarrinho", new ItemCarrinhoViewHelper());
		mapViewHelpers.put("/ecommerce_les/ExcluirItemCarrinho", new ItemCarrinhoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/CheckoutCarrinho", new CheckoutCarrinhoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/FinalizarCompra", new FinalizarCompraViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/LimparCarrinho", new LimparCarrinhoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/ConsultarPedido", new PedidoViewHelper());
		mapViewHelpers.put("/ecommerce_les/AlterarSituacaoPedido", new PedidoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/SolicitarTroca", new TrocaPedidoViewHelper());
		mapViewHelpers.put("/ecommerce_les/AlterarSituacaoPedidoTroca", new AprovarTrocaPedidoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/ConsultarVendasGrafico", new VendasGraficoViewHelper());
		
		mapViewHelpers.put("/ecommerce_les/AlterarQuantidadeItemCarrinho", new AlterarQuantidadeItemCarrinhoViewHelper());
		mapViewHelpers.put("/ecommerce_les/AlterarQuantidadeEstoque", new AlterarQuantidadeEstoque());
	}
	
	@Override
	public void init() throws ServletException {
		//Obtém a operação realizada, como parametro da requisição
		String operacaoForm = "CONSULTAR";
		
		//Obtém a uri que deu origem a requisição
		String uriDeOrigem = "/ecommerce_les/ConsultarProduto";
		
		//Obtém a view específica mapeada para a uri(chave do map)
		IViewHelper viewHelperRequisitada = mapViewHelpers.get(uriDeOrigem);
		
		//Cria entidade da viewHelper específica
		EntidadeDominio entidade = viewHelperRequisitada.obterEntidade(null);
				
		//Obtém o command específico de acordo com o parametro (tipo) operacao do form
		ICommand commandRequisitado = mapCommands.get(operacaoForm);
		
		//Executa o command passando o objeto (entidade) para realizar a operacao
		Resultado resultado = commandRequisitado.execute(entidade);
		
		getServletContext().setAttribute("produtos", resultado.getDados());
		getServletContext().setAttribute("bandeiras", resultado.getBandeiras());
		getServletContext().setAttribute("fretes", resultado.getFretes());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Obtém a operação realizada, como parametro da requisição
		String operacaoForm = req.getParameter("operacao");
		
		//Obtém a uri que deu origem a requisição
		String uriDeOrigem = req.getRequestURI();
		
		//Obtém a view específica mapeada para a uri(chave do map)
		IViewHelper viewHelperRequisitada = mapViewHelpers.get(uriDeOrigem);
		
		//LOGOUT
		if(operacaoForm.equals("SAIR")) {
			viewHelperRequisitada.setView(null, req, resp);
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//IR AO CHECKOUT
		if(operacaoForm.equals("CHECKOUT")) {
			viewHelperRequisitada.setView(null, req, resp);
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//FINALIZAR COMPRA
		if(operacaoForm.equals("FINALIZAR")) {
			viewHelperRequisitada.obterEntidade(req);
			viewHelperRequisitada.setView(null, req, resp);
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//GRÁFICO
		if(operacaoForm.equals("GERAR_GRAFICO")) {
			viewHelperRequisitada.obterEntidade(req);
			viewHelperRequisitada.setView(null, req, resp);
			return;
		}
		
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
		EntidadeDominio entidade = null;
		ICommand commandRequisitado = null;
		Resultado resultado = null;
		
		//Obtém a operação realizada, como parametro da requisição
		String operacaoForm = req.getParameter("operacao");
		
		//Obtém a uri que deu origem a requisição
		String uriDeOrigem = req.getRequestURI();
		
		//Obtém a view específica mapeada para a uri(chave do map)
		IViewHelper viewHelperRequisitada = mapViewHelpers.get(uriDeOrigem);
		
		//FINALIZAR COMPRA
		if(operacaoForm.equals("FINALIZAR")) {
			viewHelperRequisitada.obterEntidade(req);
			viewHelperRequisitada.setView(null, req, resp);
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//SOLICITAR TROCA COMPRA
		if(operacaoForm.equals("TROCAR")) {
			viewHelperRequisitada.obterEntidade(req);
			viewHelperRequisitada.setView(null, req, resp);
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//APROVAR TROCA COMPRA
		if(operacaoForm.equals("APROVAR_TROCA")) {
			viewHelperRequisitada.obterEntidade(req);
			viewHelperRequisitada.setView(null, req, resp);
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//INVALIDAR CARRINHO
		if(operacaoForm.equals("INVALIDAR")) {
			viewHelperRequisitada.obterEntidade(req);
			viewHelperRequisitada.setView(null, req, resp);
			return;
		}
		
		//ALTERAR QUANTIDADE ITEM CARRINHO
		if(uriDeOrigem.contains("AlterarQuantidadeItemCarrinho")) {
			entidade = viewHelperRequisitada.obterEntidade(req);
			
			resultado = mapCommands.get(operacaoForm).execute(entidade);
			
			//DAR BAIXA NO ESTOQUE DO PRODUTO
			if(resultado.isSucesso()) {
				uriDeOrigem = "/ecommerce_les/AlterarQuantidadeEstoque";
				IViewHelper viewHelperAux = mapViewHelpers.get(uriDeOrigem);
				entidade = viewHelperAux.obterEntidade(req);
				mapCommands.get(operacaoForm).execute(entidade);
			}
		
			viewHelperRequisitada.setView(resultado, req, resp);
			
			getServletContext().setAttribute("produtos", this.atualizaProdutos());
			return;
		}
		
		//Cria entidade da viewHelper específica
		entidade = viewHelperRequisitada.obterEntidade(req);
				
		//Obtém o command específico de acordo com o parametro (tipo) operacao do form
		commandRequisitado = mapCommands.get(operacaoForm);
		
		//Executa o command passando o objeto (entidade) para realizar a operacao
		resultado = commandRequisitado.execute(entidade);
		
		viewHelperRequisitada.setView(resultado, req, resp);
	}
	
	protected List<EntidadeDominio> atualizaProdutos() {
		//Obtém a operação realizada, como parametro da requisição
		String operacaoForm = "CONSULTAR";
		
		//Obtém a uri que deu origem a requisição
		String uriDeOrigem = "/ecommerce_les/ConsultarProduto";
		
		//Obtém a view específica mapeada para a uri(chave do map)
		IViewHelper viewHelperRequisitada = mapViewHelpers.get(uriDeOrigem);
		
		//Cria entidade da viewHelper específica
		EntidadeDominio entidade = viewHelperRequisitada.obterEntidade(null);
				
		//Obtém o command específico de acordo com o parametro (tipo) operacao do form
		ICommand commandRequisitado = mapCommands.get(operacaoForm);
		
		//Executa o command passando o objeto (entidade) para realizar a operacao
		Resultado resultado = commandRequisitado.execute(entidade);
		
		return resultado.getDados();
	}
}

package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ExcluirCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.controle.SalvarCommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.Cupom;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Transacao;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FinalizarCompraViewHelperORIGINAL implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		Cliente cli = (Cliente) req.getSession().getAttribute("usuario_logado");
		
		String pedido_valor_total = req.getParameter("pedido_valor_total");
		//String cupom_selecionado = req.getParameter("cupom_selecionado");
		String pedido_situacao = "EM PROCESSAMENTO";
		String[] pedido_cartoes_selecionados = req.getParameterValues("cartao_selecionado");
		String[] pedido_cupons_selecionados = req.getParameterValues("cupom_selecionado");
		
		Map<String, String> mapCartaoValor = new HashMap<>();
		for(String cartao_id : pedido_cartoes_selecionados) {
			mapCartaoValor.put(String.valueOf(cartao_id), req.getParameter("valor_a_ser_pago_" + cartao_id));
		}
		
		Carrinho carrinho = (Carrinho) req.getSession().getAttribute("carrinho");
		
		//CADASTRA PEDIDO
		ICommand command = new SalvarCommand();
		Pedido pedido = new Pedido(Float.parseFloat(pedido_valor_total), pedido_situacao, null, null, cli.getId());
		Resultado resultado_pedido = command.execute(pedido);
		pedido = (Pedido) resultado_pedido.getDados().get(0);
		
		//CADASTRA TRANSACOES
		if(resultado_pedido.getDados().size() > 0) {	
			for (Map.Entry<String, String> set : mapCartaoValor.entrySet()) {
				EntidadeDominio transacao = new Transacao(Integer.parseInt(set.getKey()), Float.parseFloat(set.getValue()), pedido.getId());
				command.execute(transacao);
			}
		}
		
		//CADASTRA ITENS PEDIDO
		for(ItemCarrinho itemCarrinho : carrinho.getItens()) {
			ItemPedido itemPedido = new ItemPedido(itemCarrinho.getQuantidade(), itemCarrinho.getPreco_unitario(), itemCarrinho.getProduto_id(), pedido.getId());
			command.execute(itemPedido);
		}
		
		//ALTERA CUPOM UTILIZADO
		if(pedido_cupons_selecionados != null) {
			for(String cupom_selecionado : pedido_cupons_selecionados) {
				command = new AlterarCommand();
				Cupom cupom = new Cupom();
				cupom.setId(Integer.parseInt(cupom_selecionado));
				cupom.setValido(0);
				command.execute(cupom);
			}
		}
		
		
		//EXCLUI CARRINHO
		command = new ExcluirCommand();
		command.execute(carrinho);
		
		//CRIA NOVO CARRINHO
		command = new SalvarCommand();
		String carrinho_session_id = req.getSession().getId();
		int carrinho_cliente_id = cli.getId();
		carrinho = new Carrinho(carrinho_session_id, carrinho_cliente_id);
		Resultado resultado_carrinho = command.execute(carrinho);
		
		//ATUALIZA USUARIO LOGADO
		command = new ConsultarCommand();
		Resultado resultado_usuario_logado = command.execute(cli);
		cli = (Cliente) resultado_usuario_logado.getDados().get(0);
		//cli.setJson();	
		
		req.getSession().setAttribute("resultado", resultado_pedido);
		req.getSession().setAttribute("carrinho", resultado_carrinho.getDados().get(0));
		req.getSession().setAttribute("pedido_realizado", resultado_pedido.getDados().get(0));
		req.getSession().setAttribute("usuario_logado", cli);
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		
		if(resultado == null) {
			try {
				resp.sendRedirect("resultado.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(!resultado.getDados().isEmpty()) {
			//RETORNA O "LOGIN" DO CLIENTE
			Cliente cliente = (Cliente) resultado.getDados().get(0);
			//cliente.setJson();
			req.getSession().setAttribute("usuario_logado", cliente);
			
			//SE EXISTIR CARRINHO PARA A SESSAO, VINCULA AO CLIENTE
			ICommand command = new ConsultarCommand();
			EntidadeDominio carrinho = (Carrinho) new Carrinho(req.getSession(false).getId(), 0);
			Resultado resultado_continuacao = command.execute(carrinho);
			
			if(resultado_continuacao.getDados().size() > 0) {
				command = new AlterarCommand();
				EntidadeDominio carrinho_vinculado = new Carrinho(req.getSession(false).getId(), cliente.getId());
				carrinho_vinculado.setId(carrinho.getId());
				resultado_continuacao = command.execute(carrinho_vinculado);
			}
			
			req.getSession().setAttribute("carrinho", resultado_continuacao.getDados().get(0));
			
			try {
				resp.sendRedirect("index.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("account.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

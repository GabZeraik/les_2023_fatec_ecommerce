package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.controle.SalvarCommand;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.modelo.ItemTroca;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.PedidoTroca;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TrocaPedidoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String pedido_situacao = "EM TROCA";
		
		Pedido pedido = new Pedido();
		PedidoTroca pedido_troca = new PedidoTroca();
		
		for(String item_selecionado_id : req.getParameterValues("item_selecionado_troca")) {
			//Consulta o item do pedido
			ItemPedido item_pedido = new ItemPedido();
			item_pedido.setId(Integer.parseInt(item_selecionado_id));
			ICommand command = new ConsultarCommand();
			Resultado resultado_item_pedido = command.execute(item_pedido);
			item_pedido = (ItemPedido) resultado_item_pedido.getDados().get(0);
			
			//Consulta o pedido
			pedido.setId(item_pedido.getPedido_id());
			Resultado resultado_pedido = command.execute(pedido);
			pedido = (Pedido) resultado_pedido.getDados().get(0);
			
			//Cria item de troca
			ItemTroca item_troca = new ItemTroca();
			item_troca.setQuantidade(Integer.parseInt(req.getParameter("item_quantidade_troca_".concat(item_selecionado_id))));
			item_troca.setPreco_unitario(item_pedido.getPreco_unitario());
			item_troca.setItem_pedido_id(item_pedido.getId());
	
			pedido_troca.adicionaItemTroca(item_troca);
		}
		
		pedido_troca.calculaValorTotal();
		pedido_troca.setCliente_id(pedido.getCliente_id());
		pedido_troca.setSituacao(pedido_situacao);
		
		ICommand command = new SalvarCommand();
		Resultado resultado_pedido_troca = command.execute(pedido_troca);
		PedidoTroca pedido_troca_cadastrado = (PedidoTroca) resultado_pedido_troca.getDados().get(0);
		
		for (ItemTroca item_troca : pedido_troca.getItem_troca()) {
			item_troca.setPedido_troca_id(pedido_troca_cadastrado.getId());
			command.execute(item_troca);
		}
		
		command = new AlterarCommand();
		pedido.setSituacao(pedido_situacao);
		Resultado resultado_alteração_pedido = command.execute(pedido);
		req.getSession().setAttribute("resultado", resultado_alteração_pedido);
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		try {
			resp.sendRedirect("resultado.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

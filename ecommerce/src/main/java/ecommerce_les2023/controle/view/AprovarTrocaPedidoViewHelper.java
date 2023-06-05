package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.controle.SalvarCommand;
import ecommerce_les2023.modelo.Cupom;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.modelo.ItemTroca;
import ecommerce_les2023.modelo.PedidoTroca;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AprovarTrocaPedidoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String pedido_situacao = req.getParameter("situacao_troca");
		String id_troca = req.getParameter("id_troca");
		
		ICommand command = new ConsultarCommand();
		PedidoTroca pedido_troca = new PedidoTroca();
		pedido_troca.setId(Integer.parseInt(id_troca));
		pedido_troca = (PedidoTroca) command.execute(pedido_troca).getDados().get(0);
		
		command = new AlterarCommand();
		pedido_troca.setSituacao(pedido_situacao);
		Resultado resultado = command.execute(pedido_troca);
		pedido_troca = (PedidoTroca) resultado.getDados().get(0);
		
		if(pedido_situacao.contains("AUTORIZADA")) {
			command = new SalvarCommand();
			Cupom cupom_troca = new Cupom(pedido_troca.gerarCodigoUnico(), pedido_troca.getValor_total(), "TROCA", pedido_troca.getCliente_id(), 1);
			resultado = command.execute(cupom_troca);
			cupom_troca = (Cupom) resultado.getDados().get(0);
			
			System.out.println("CUPOM CRIADO: " + cupom_troca);
			
			for(ItemTroca item_trocado : pedido_troca.getItem_troca()) {
				command = new ConsultarCommand();
				//obtém o item do pedido
				ItemPedido item_pedido = new ItemPedido();
				item_pedido.setId(item_trocado.getItem_pedido_id());
				item_pedido = (ItemPedido) command.execute(item_pedido).getDados().get(0);
				
				//obtém o produto do item
				Produto produto = new Produto();
				produto.setId(item_pedido.getProduto_id());
				produto = (Produto) command.execute(produto).getDados().get(0);
				
				//altera quantidade de produto (estoque)
				command = new AlterarCommand();
				System.out.println("ESTOQUE: ");
				System.out.println(produto.getEstoque_mao());
				System.out.println("QUANTIDADE TROCADA: ");
				System.out.println(item_trocado.getQuantidade());
				produto.setEstoque_mao(produto.getEstoque_mao() + item_trocado.getQuantidade());
				command.execute(produto);
			}
			
			command = new AlterarCommand();
			pedido_troca.setCupom_id(cupom_troca.getId());
			resultado = command.execute(pedido_troca);
			pedido_troca = (PedidoTroca) resultado.getDados().get(0);
		}
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		try {
			resp.sendRedirect("admin_pedidos.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

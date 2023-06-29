package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.List;

import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VendasGraficoViewHelper implements IViewHelper {
	
	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		EntidadeDominio pedido = new Pedido();
		EntidadeDominio produto = new Produto();
		pedido.setId(0);
		produto.setId(0);
		
		ICommand command = new ConsultarCommand();
		Resultado resultado_pedidos = command.execute(pedido);
		List<EntidadeDominio> pedidos = resultado_pedidos.getDados();
		
		Resultado resultado_produtos = command.execute(produto);
		List<EntidadeDominio> produtos = resultado_produtos.getDados();
				
		req.getSession().setAttribute("pedidos", pedidos);
		req.getSession().setAttribute("produtos", produtos);
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		try {
			resp.sendRedirect("admin_dados.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
}

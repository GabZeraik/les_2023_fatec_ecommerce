package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ItemPedidoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String item_tipo = req.getParameter("tipo_tabela_item");
		String item_quantidade = req.getParameter("item_quantidade");
		String item_preco_unitario = req.getParameter("item_preco_unitario");
		String item_produtos_pro_id = req.getParameter("produtos_pro_id");
		String item_fk_id = req.getParameter(item_tipo.concat("_id"));
		
		EntidadeDominio item = new ItemPedido(Integer.parseInt(item_quantidade), Float.parseFloat(item_preco_unitario), Integer.parseInt(item_produtos_pro_id), Integer.parseInt(item_fk_id));
		
		return item;
	}
	
	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		
		if (resultado.getOperacao() != "CONSULTAR") {
			req.getSession().setAttribute("resultado", resultado);
			
			//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
			try {
				resp.sendRedirect("checkout.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

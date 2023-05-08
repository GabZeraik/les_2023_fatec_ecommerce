package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PedidoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String pedido_id = req.getParameter("pedido_id");
		String codigo_pedido = req.getParameter("codigo_pedido");
		String situacao_pedido = req.getParameter("situacao_pedido");
		String codigo_cliente_pedido = req.getParameter("codigo_cliente");

		int id_cliente = 0;
		if(codigo_cliente_pedido != "" && codigo_cliente_pedido != null) {
			id_cliente = Integer.parseInt(codigo_cliente_pedido);
		}
		
		EntidadeDominio pedido = new Pedido(codigo_pedido, situacao_pedido, id_cliente);
		
		if(pedido_id != "" && pedido_id != null) {
			pedido.setId(Integer.parseInt(pedido_id));
		}
		
		return pedido;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		
		resultado.setJson_dados();
		req.getSession().setAttribute("pedidos", resultado.getJson_dados());
		
		try {
			resp.sendRedirect("admin_pedidos.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String carrinho_session_id = req.getSession().getId();
		Cliente cliente = (Cliente) req.getSession().getAttribute("usuario_logado");
		int carrinho_cliente_id = cliente.getId();
		
		EntidadeDominio carrinho = new Carrinho(carrinho_session_id, carrinho_cliente_id);
		return carrinho;
	}
	
	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("carrinho", resultado.getDados().get(0));
		
		try {
			resp.sendRedirect("index.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

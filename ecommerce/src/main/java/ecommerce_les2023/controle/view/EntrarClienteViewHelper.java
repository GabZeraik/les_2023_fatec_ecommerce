package ecommerce_les2023.controle.view;

import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EntrarClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String senha_cliente = req.getParameter("senha_cliente");
		String email_cliente = req.getParameter("email_cliente");
				
		EntidadeDominio cliente = new Cliente(email_cliente, senha_cliente);
				
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		if(!resultado.getDados().isEmpty()) {
			Cliente cliente = (Cliente) resultado.getDados().get(0);
			cliente.setJson();
			req.getSession().setAttribute("usuario_logado", cliente);
		}
	}
}

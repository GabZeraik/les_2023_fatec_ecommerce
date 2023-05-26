package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InativarClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		String id_cliente = req.getParameter("codigo_status_cliente");
		String status_cliente = req.getParameter("status_cliente");
		String categoria_status_cliente = req.getParameter("categoria_status_cliente");
		String justificativa_status_cliente = req.getParameter("justificativa_status_cliente");
		
		System.out.println(id_cliente);
		System.out.println(status_cliente);
		System.out.println(categoria_status_cliente);
		System.out.println(justificativa_status_cliente);
		
		EntidadeDominio cliente = new Cliente(status_cliente, categoria_status_cliente, justificativa_status_cliente);	
		cliente.setId(Integer.parseInt(id_cliente));
		
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		Cliente cli = (Cliente) resultado.getDados().get(0);
		StringBuilder sb = new StringBuilder();
		sb.append("ConsultarCliente?operacao=CONSULTAR&cli_id=");
		sb.append(cli.getId());
		
		try {
			resp.sendRedirect(sb.toString());
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

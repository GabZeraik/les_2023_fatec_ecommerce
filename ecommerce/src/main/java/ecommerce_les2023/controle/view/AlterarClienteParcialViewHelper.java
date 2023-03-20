package ecommerce_les2023.controle.view;

import java.io.IOException;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Telefone;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlterarClienteParcialViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		String id_cliente = req.getParameter("id_cliente");
		String usuario_cliente = req.getParameter("usuario_cliente");
		String senha_cliente = req.getParameter("senha_cliente");
		String nome_cliente = req.getParameter("nome_cliente");
		String genero_cliente = req.getParameter("genero_cliente");
		String data_nascimento_cliente = req.getParameter("data_nascimento_cliente").toString();
		String cpf_cliente = req.getParameter("cpf_cliente");
		String email_cliente = req.getParameter("email_cliente");
		String telefone_ddd_cliente = req.getParameter("telefone_ddd_cliente");
		String telefone_numero_cliente = req.getParameter("telefone_numero_cliente");
		String telefone_tipo_cliente = req.getParameter("telefone_tipo_cliente");
				
		EntidadeDominio cliente = new Cliente(nome_cliente, cpf_cliente, email_cliente, genero_cliente, data_nascimento_cliente, usuario_cliente, senha_cliente, new Telefone(telefone_ddd_cliente, telefone_numero_cliente, telefone_tipo_cliente));	
		cliente.setId(Integer.parseInt(id_cliente));
		
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
		try {
			resp.sendRedirect("resultado.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

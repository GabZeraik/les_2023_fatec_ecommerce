package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProdutoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		EntidadeDominio produto = new Produto();
		if(req != null && req.getParameter("pro_id") != null) produto.setId(Integer.parseInt(req.getParameter("pro_id")));
		return produto;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		
		//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
		try {
			resp.sendRedirect("product_detail.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

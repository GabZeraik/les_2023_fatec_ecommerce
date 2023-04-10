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
		if(req != null && req.getParameter("pro_id") != "0") produto.setId(Integer.parseInt(req.getParameter("pro_id")));
		return produto;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		if(resultado.getDados().size() > 1) {

			try {
				resp.sendRedirect("products.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else if(resultado.getDados().size() == 1){
			
			try {
				resp.sendRedirect("product_detail.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Bandeira;
import ecommerce_les2023.modelo.Cartao;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartaoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String car_numero = req.getParameter("cartao_numero");
		String car_bandeira = req.getParameter("cartao_bandeira");
		String car_validade = req.getParameter("cartao_validade");
		String car_cvv = req.getParameter("cartao_cvv");
		String car_nome = req.getParameter("cartao_nome");
		String car_preferencial = req.getParameter("cartao_preferencial");
		String car_cliente_id = req.getParameter("cartao_cliente_id");
		
		EntidadeDominio cartao = new Cartao(car_numero, car_nome, car_validade, car_cvv, car_preferencial, new Bandeira(Integer.parseInt(car_bandeira)), Integer.parseInt(car_cliente_id));
		return cartao;
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

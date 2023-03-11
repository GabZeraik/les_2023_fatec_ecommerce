package ecommerce_les2023.controle.view;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface IViewHelper {

	public EntidadeDominio obterEntidade(HttpServletRequest requisicao);
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp);
	
}

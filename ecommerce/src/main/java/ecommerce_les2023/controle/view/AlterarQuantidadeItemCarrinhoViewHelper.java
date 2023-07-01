package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.Map;

import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlterarQuantidadeItemCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		Map<String, String[]> map_parametros = req.getParameterMap();
		int id_item = 0, quantidade_item = 0;
		ICommand command = new ConsultarCommand();
		ItemCarrinho item_aux = null;
		ItemCarrinho item_salvo = null;
		
		for(String key : map_parametros.keySet()) {
			if(key.contains("item_carrinho_")) {
				item_aux = new ItemCarrinho();
				id_item = Integer.parseInt(key.split("item_carrinho_")[1]);
				quantidade_item = Integer.parseInt(map_parametros.get(key)[0]);
				item_aux.setId(id_item);
				item_salvo = (ItemCarrinho) command.execute(item_aux).getDados().get(0);
				req.setAttribute("temp_item_salvo", item_salvo);
				item_aux.setQuantidade(quantidade_item);
				req.setAttribute("temp_item_atualizado", item_aux);
			}
		}
		return item_aux;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		
		if(resultado.isSucesso()) {
			ItemCarrinho item_carrinho = (ItemCarrinho) req.getAttribute("temp_item_salvo");
			ICommand command = new ConsultarCommand();
			Carrinho carrinho = new Carrinho();
			carrinho.setId(item_carrinho.getCarrinho_id());
			carrinho = (Carrinho) command.execute(carrinho).getDados().get(0);
			req.getSession().setAttribute("carrinho", carrinho);
			
			try {
				resp.sendRedirect("cart.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("resultado.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
}

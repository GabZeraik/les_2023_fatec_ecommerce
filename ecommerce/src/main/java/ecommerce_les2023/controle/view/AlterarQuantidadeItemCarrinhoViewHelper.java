package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.Map;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlterarQuantidadeItemCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		Map<String, String[]> map_parametros = req.getParameterMap();
		int id_item = 0, quantidade_item = 0, quantidade_real = 0;
		ICommand command = new ConsultarCommand();
		
		for(String key : map_parametros.keySet()) {
			if(key.contains("item_carrinho_")) {
				id_item = Integer.parseInt(key.split("item_carrinho_")[1]);
				quantidade_item = Integer.parseInt(map_parametros.get(key)[0]);
				ItemCarrinho item_aux = new ItemCarrinho();
				item_aux.setId(id_item);
				item_aux = (ItemCarrinho) command.execute(item_aux).getDados().get(0);
				
				Produto produto = new Produto();
				produto.setId(item_aux.getProduto_id());
				produto = (Produto) command.execute(produto).getDados().get(0);
				quantidade_real = produto.getEstoque_mao() + item_aux.getQuantidade();
				produto.setEstoque_mao(quantidade_real);
				command = new AlterarCommand();
				command.execute(produto);
				
				item_aux.setQuantidade(quantidade_item);
				Resultado resultado_alteracao = command.execute(item_aux);
				
			}
		}
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		try {
			resp.sendRedirect("resultado.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

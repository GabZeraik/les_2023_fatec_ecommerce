package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ItemCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String item_tipo = req.getParameter("tipo_tabela_item");
		String item_quantidade = req.getParameter("item_carrinho_quantidade");
		String item_preco_unitario = req.getParameter("item_carrinho_preco_unitario");
		String item_produtos_pro_id = req.getParameter("item_produto_id");
		String item_fk_id = req.getParameter(item_tipo.concat("_id"));
		
		EntidadeDominio item = new ItemCarrinho(Integer.parseInt(item_quantidade), Float.parseFloat(item_preco_unitario), Integer.parseInt(item_produtos_pro_id), Integer.parseInt(item_fk_id));
		
		return item;
	}
	
	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		ICommand command = new ConsultarCommand();
		EntidadeDominio carrinho = (Carrinho) req.getSession().getAttribute("carrinho");
		Resultado resultado_continuacao = command.execute(carrinho);		
		
		req.getSession().setAttribute("carrinho", resultado_continuacao.getDados().get(0));
			
		//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
		try {
			resp.sendRedirect("cart.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

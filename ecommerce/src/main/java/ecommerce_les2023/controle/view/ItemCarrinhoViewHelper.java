package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.controle.SalvarCommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ItemCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String item_tipo = req.getParameter("tipo_tabela_item");
		String item_quantidade = req.getParameter("item_carrinho_quantidade");
		String item_preco_unitario = req.getParameter("item_carrinho_preco_unitario");
		String item_produto_pro_id = req.getParameter("item_produto_id");
		String item_fk_id = req.getParameter(item_tipo.concat("_id"));
		String item_id = req.getParameter("item_id");
				
		if(item_fk_id.equals("") || item_fk_id == null) {
			EntidadeDominio carrinho;
			
			if(req.getParameter("usuario_logado") != null) {
				Cliente cli = (Cliente) req.getSession().getAttribute("usuario_logado");
				carrinho = (Carrinho) new Carrinho(req.getSession(false).getId(), cli.getId());
			}else carrinho = (Carrinho) new Carrinho(req.getSession(false).getId(), 0);
			
			ICommand command = new SalvarCommand();
			Resultado resultado_carrinho = new Resultado();
			resultado_carrinho = command.execute(carrinho);
			Carrinho carrinho_criado = (Carrinho) resultado_carrinho.getDados().get(0);
			item_fk_id = String.valueOf(carrinho_criado.getId());
			
			req.getSession().setAttribute("carrinho", carrinho_criado);
		}
		
		EntidadeDominio item = new ItemCarrinho(Integer.parseInt(item_quantidade), Float.parseFloat(item_preco_unitario), Integer.parseInt(item_produto_pro_id), Integer.parseInt(item_fk_id));
		
		if(req.getParameter("item_id") != null){
			item.setId(Integer.parseInt(item_id));
		}
		
		return item;
	}
	
	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		ItemCarrinho item_adicionado = (ItemCarrinho) resultado.getDados().get(0);
		
		//RETORNA O CARRINHO ATUALIZADO
		ICommand command = new ConsultarCommand();
		EntidadeDominio carrinho = (Carrinho) new Carrinho(req.getSession(false).getId(), 0);
		Resultado resultado_carrinho = command.execute(carrinho);
		
		req.getSession().setAttribute("carrinho", resultado_carrinho.getDados().get(0));
		
		//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
		try {
			if(!resultado.isSucesso()) {
				req.getSession().setAttribute("resultado", resultado);
				resp.sendRedirect("resultado.jsp");
			}
			else {
				//DAR BAIXA NO ESTOQUE MÃO DO PRODUTO
				command = new ConsultarCommand();
				Produto produto_baixa_estoque = new Produto();
				produto_baixa_estoque.setId(item_adicionado.getProduto_id());
				Produto produto_final = (Produto) command.execute(produto_baixa_estoque).getDados().get(0);
				command = new AlterarCommand();
				if(req.getRequestURI().contains("ExcluirItemCarrinho")) {
					produto_final.setEstoque_mao(produto_final.getEstoque_mao() + item_adicionado.getQuantidade());
				}else produto_final.setEstoque_mao(produto_final.getEstoque_mao() - item_adicionado.getQuantidade());
				command.execute(produto_final);
				resp.sendRedirect("cart.jsp");
			}
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

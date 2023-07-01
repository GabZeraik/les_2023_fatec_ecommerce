package ecommerce_les2023.negocio;

import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ItemCarrinhoDAO;
import ecommerce_les2023.dao.ProdutoDAO;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Produto;

public class VerificadorEstoqueProdutoStrategy2 implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		
		if(entidade instanceof Pedido){
			Pedido pedido = (Pedido) entidade;
			Produto produto = new Produto();
			for(ItemPedido item_pedido: pedido.getItem_pedido()) {
				produto.setId(item_pedido.getProduto_id());
				IDAO produtoDAO = new ProdutoDAO();
				Produto produto_retornado = (Produto) produtoDAO.consultar(produto).get(0);
				
				if(produto_retornado.getEstoque_mao() < item_pedido.getQuantidade()) {
					return "A quantidade escolhida do produto " + produto_retornado.getNome() + " é maior do que a presente em nosso estoque (" + produto_retornado.getEstoque_mao() + ").";
				}
			}
			
		}
		
		if(entidade instanceof ItemCarrinho){
			ItemCarrinho itemCarrinho = (ItemCarrinho) entidade;
			ItemCarrinho item_salvo = new ItemCarrinho();
			Produto produto = new Produto();
			int diferenca_quantidade_pedido = 0;
			
			IDAO itemCarrinhoDAO = new ItemCarrinhoDAO();
			item_salvo.setId(itemCarrinho.getId());
			item_salvo = (ItemCarrinho) itemCarrinhoDAO.consultar(item_salvo).get(0);
			
			if(item_salvo.getQuantidade() != itemCarrinho.getQuantidade()) {
				produto.setId(itemCarrinho.getProduto_id());
				IDAO produtoDAO = new ProdutoDAO();
				Produto produto_retornado = (Produto) produtoDAO.consultar(produto).get(0);
				
				diferenca_quantidade_pedido = itemCarrinho.getQuantidade() - item_salvo.getQuantidade();
				
				if(produto_retornado.getEstoque_mao() < diferenca_quantidade_pedido) {
					return "A quantidade (" + item_salvo.getQuantidade() + diferenca_quantidade_pedido + ") escolhida do produto " + produto_retornado.getNome() + " é maior do que a presente em nosso estoque (" + (produto_retornado.getEstoque_mao() + item_salvo.getQuantidade())  + ").";
				}
			}
			
			
		}
		return null;
	}
}

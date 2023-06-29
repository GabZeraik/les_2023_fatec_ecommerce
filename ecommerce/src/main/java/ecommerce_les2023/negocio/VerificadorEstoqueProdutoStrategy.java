package ecommerce_les2023.negocio;

import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ProdutoDAO;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Produto;

public class VerificadorEstoqueProdutoStrategy implements IStrategy {

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
			Produto produto = new Produto();
			
			produto.setId(itemCarrinho.getProduto_id());
			IDAO produtoDAO = new ProdutoDAO();
			Produto produto_retornado = (Produto) produtoDAO.consultar(produto).get(0);
			
			if(produto_retornado.getEstoque_mao() < itemCarrinho.getQuantidade()) {
				return "A quantidade escolhida do produto " + produto_retornado.getNome() + " é maior do que a presente em nosso estoque (" + produto_retornado.getEstoque_mao() + ").";
			}
		}
		return null;
	}
}

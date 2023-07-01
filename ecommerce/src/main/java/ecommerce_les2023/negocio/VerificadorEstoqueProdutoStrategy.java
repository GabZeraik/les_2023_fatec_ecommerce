package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ItemCarrinhoDAO;
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
			int diferenca_quantidade_pedido = 0;
			
			//SE AINDA NÃO ESTIVER CADASTRADO COMO ITEM
			ItemCarrinho itemCarrinho = (ItemCarrinho) entidade;
			
			//SE JÁ ESTIVER CADASTRADO
			ItemCarrinho item_salvo = new ItemCarrinho();
			if(itemCarrinho.getId() != 0) {
				item_salvo.setId(itemCarrinho.getId());
				IDAO itemCarrinhoDAO = new ItemCarrinhoDAO();
				List<EntidadeDominio> resultado_busca_item_carrinho = itemCarrinhoDAO.consultar(item_salvo);
				if(resultado_busca_item_carrinho != null && resultado_busca_item_carrinho.size() > 0) {
					item_salvo = (ItemCarrinho) resultado_busca_item_carrinho.get(0);
				}
				diferenca_quantidade_pedido = itemCarrinho.getQuantidade() - item_salvo.getQuantidade();
				if(diferenca_quantidade_pedido <= 0) {
					return null;
				}
			}			
			
			Produto produto = new Produto();
			produto.setId(itemCarrinho.getProduto_id());
			IDAO produtoDAO = new ProdutoDAO();
			Produto produto_retornado = (Produto) produtoDAO.consultar(produto).get(0);	
						
			if(produto_retornado.getEstoque_mao() < diferenca_quantidade_pedido) {
				diferenca_quantidade_pedido += item_salvo.getQuantidade();
				if(itemCarrinho.getId() != 0) return "A quantidade (" + diferenca_quantidade_pedido + ") escolhida do produto " + produto_retornado.getNome() + " é maior do que a presente em nosso estoque (" + (produto_retornado.getEstoque_mao() + item_salvo.getQuantidade())  + ").";
				else return "A quantidade (" + itemCarrinho.getQuantidade() + ") escolhida do produto " + produto_retornado.getNome() + " é maior do que a presente em nosso estoque (" + produto_retornado.getEstoque_mao()+ ")."; 
			}
		}
		return null;
	}
}

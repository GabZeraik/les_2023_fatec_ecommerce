package ecommerce_les2023.controle.view;

import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlterarQuantidadeEstoque implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		Resultado resultado_alteracao_item = (Resultado) req.getSession().getAttribute("resultado");
		ItemCarrinho item_salvo = (ItemCarrinho) req.getAttribute("temp_item_salvo");
		ItemCarrinho item_atualizado = (ItemCarrinho) req.getAttribute("temp_item_atualizado");
		int quantidade_baixa = 0;
		ICommand command = new ConsultarCommand();
		Produto produto = new Produto();
		produto.setId(item_salvo.getProduto_id());
		produto = (Produto) command.execute(produto).getDados().get(0);
		
		if(resultado_alteracao_item.isSucesso()) {
			quantidade_baixa = item_atualizado.getQuantidade() - item_salvo.getQuantidade();
			produto.setEstoque_mao(produto.getEstoque_mao() - (quantidade_baixa));
		}
		return produto;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		return;
	}
}

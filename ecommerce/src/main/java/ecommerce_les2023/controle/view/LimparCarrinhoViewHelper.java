package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.time.LocalTime;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ExcluirCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.modelo.Produto;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LimparCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest requisicao) {
		
		ICommand command;
		Carrinho carrinho = (Carrinho) requisicao.getSession().getAttribute("carrinho");
		
		for(ItemCarrinho item : carrinho.getItens()) {
			command = new ConsultarCommand();
			Produto pro = new Produto();
			pro.setId(item.getProduto_id());
			pro = (Produto) command.execute(pro).getDados().get(0);
			
			command = new AlterarCommand();
			pro.setEstoque_mao(pro.getEstoque_mao() + item.getQuantidade());
			command.execute(pro);
			
			command = new ExcluirCommand();
			command.execute(item);
		}
		
		command = new AlterarCommand();
		carrinho.setExpira_em(LocalTime.now().toString());
		command.execute(carrinho);
		
		command = new ConsultarCommand();
		carrinho = (Carrinho) command.execute(carrinho).getDados().get(0);
		
		requisicao.getSession().setAttribute("carrinho", carrinho);
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		try {
			resp.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

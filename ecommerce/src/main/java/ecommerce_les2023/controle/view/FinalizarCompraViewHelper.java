package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FinalizarCompraViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		
		if(!resultado.getDados().isEmpty()) {
			//RETORNA O "LOGIN" DO CLIENTE
			Cliente cliente = (Cliente) resultado.getDados().get(0);
			cliente.setJson();
			req.getSession().setAttribute("usuario_logado", cliente);
			
			//SE EXISTIR CARRINHO PARA A SESSAO, VINCULA AO CLIENTE
			ICommand command = new ConsultarCommand();
			EntidadeDominio carrinho = (Carrinho) new Carrinho(req.getSession(false).getId(), 0);
			Resultado resultado_continuacao = command.execute(carrinho);
			
			if(resultado_continuacao.getDados().size() > 0) {
				command = new AlterarCommand();
				EntidadeDominio carrinho_vinculado = new Carrinho(req.getSession(false).getId(), cliente.getId());
				carrinho_vinculado.setId(carrinho.getId());
				resultado_continuacao = command.execute(carrinho_vinculado);
			}
			
			req.getSession().setAttribute("carrinho", resultado_continuacao.getDados().get(0));
			
			try {
				resp.sendRedirect("index.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			
			try {
				resp.sendRedirect("account.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

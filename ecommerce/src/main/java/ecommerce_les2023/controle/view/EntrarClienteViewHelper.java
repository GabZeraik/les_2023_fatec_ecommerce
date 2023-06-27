package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.controle.AlterarCommand;
import ecommerce_les2023.controle.ConsultarCommand;
import ecommerce_les2023.controle.ICommand;
import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EntrarClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String senha_cliente = req.getParameter("senha_cliente");
		String email_cliente = req.getParameter("email_cliente");
				
		EntidadeDominio cliente = new Cliente(email_cliente, senha_cliente);
				
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		
		if(!resultado.getDados().isEmpty()) {
			ICommand command = new ConsultarCommand();
			//RETORNA O "LOGIN" DO CLIENTE
			Cliente cliente = (Cliente) resultado.getDados().get(0);
			List<Pedido> pedidos = new ArrayList<>();
			
			if(!cliente.getPedido().isEmpty()) {
				pedidos = List.copyOf(cliente.getPedido());
				cliente.setPedido(null);
				for(Pedido pedido: pedidos) {
					Pedido ped = (Pedido) command.execute(pedido).getDados().get(0);
					cliente.adicionaPedido(ped);
				}
			} 
			
			cliente.setJson();
			req.getSession().setAttribute("usuario_logado", cliente);
			
			//SE EXISTIR CARRINHO PARA A SESSAO, VINCULA AO CLIENTE
			EntidadeDominio carrinho = new Carrinho(req.getSession(false).getId(), 0);
			Resultado resultado_continuacao = command.execute(carrinho);
			
			if(resultado_continuacao.getDados().size() > 0) {
				command = new AlterarCommand();
				Carrinho carrinho_salvo = (Carrinho) resultado_continuacao.getDados().get(0);
				carrinho_salvo.setCliente_id(cliente.getId());
				resultado_continuacao = command.execute(carrinho_salvo);
				req.getSession().setAttribute("carrinho", resultado_continuacao.getDados().get(0));
			}
			
			if(req.getParameter("operacao") == "FINALIZAR") {
				try {
					resp.sendRedirect("checkout.jsp");
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else if(req.getSession().getAttribute("carrinho") != null) {
				try {
					resp.sendRedirect("cart.jsp");
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					resp.sendRedirect("index.jsp");
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			try {
				resp.sendRedirect("register.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

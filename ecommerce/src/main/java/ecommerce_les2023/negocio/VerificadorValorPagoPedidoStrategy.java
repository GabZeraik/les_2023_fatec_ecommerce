package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.Cupom;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Transacao;

public class VerificadorValorPagoPedidoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		
		if(entidade instanceof Pedido){
			Pedido pedido = (Pedido) entidade;
			float valor_final_transacoes = 0, valor_final_pedido_com_cupom = pedido.getValor_total();
			boolean cupom_utilizado = false;
			System.out.println("VALOR TOTAL COMPRA: " + pedido.getValor_total());
			
			if(pedido.getCupom_pedido() != null) {
				cupom_utilizado = true;
				for(Cupom cupom : pedido.getCupom_pedido()) {
					valor_final_pedido_com_cupom = valor_final_pedido_com_cupom - cupom.getValor();
				}
			}
			
			for(Transacao transacao : pedido.getTransacao()) {				
				if(!cupom_utilizado) {
					String valor_minimo_cartao = new VerificadorValorMinimoCartaoStrategy().processarStrategy(transacao);
					System.out.println("VALOR MINIMO CARTAO: " + valor_minimo_cartao);
					if(valor_minimo_cartao == null || valor_minimo_cartao.equals("")) {
						valor_final_transacoes += transacao.getValor_pago();
					}else return valor_minimo_cartao;
				}else {
					valor_final_transacoes += transacao.getValor_pago();
				}
			}
			
			System.out.println("VALOR FINAL TRANSACOES: " + valor_final_transacoes);
			System.out.println("VALOR FINAL PEDIDO: " + valor_final_pedido_com_cupom);
			if(valor_final_transacoes != valor_final_pedido_com_cupom) {
				return "O valor total digitado para o(s) cartão(ões) R$" + valor_final_transacoes + " não corresponde ao valor a ser pago R$" + valor_final_pedido_com_cupom;
			}
		}
		return null;
	}
}

package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Transacao;

public class VerificadorValorNaoZeroCartaoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		
		if(entidade instanceof Pedido){
			Pedido pedido = (Pedido) entidade;
			for(Transacao transacao : pedido.getTransacao()) {
				if(transacao.getValor_pago() == 0) {
					return "Uma compra não pode ser realizada com um cartão selecionado sem valor ou valor = R$0,00";
				}
			}
		}
		return null;
	}
}

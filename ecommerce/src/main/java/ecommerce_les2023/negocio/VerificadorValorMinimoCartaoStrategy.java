package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Transacao;

public class VerificadorValorMinimoCartaoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		
		if(entidade instanceof Transacao){
			Transacao transacao = (Transacao) entidade;
			if(transacao.getValor_pago() < 10) {
				return "RN0034 - Uma compra pode ser paga utilizando mais de um cartão de crédito, porém o valor mínimo para ser pago com cada cartão deve ser R$ 10,00.";
			}
		}
		return null;
	}
}

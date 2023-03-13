package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pessoa;

public class VerificadorDigitosCpfStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Cliente){
			Pessoa pessoa = (Pessoa) entidade;
			if(pessoa.getCpf().length() != 11){
				return "RNF000: O campo CPF deve conter 11 caracteres (somente números) para pessoa física";
			}
		}		
		return null;
	}
}

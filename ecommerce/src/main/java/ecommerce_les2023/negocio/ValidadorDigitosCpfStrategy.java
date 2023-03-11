package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pessoa;
import ecommerce_les2023.modelo.Professor;

public class ValidadorDigitosCpfStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Aluno || entidade instanceof Professor){
			Pessoa pessoa = (Pessoa) entidade;
			if(pessoa.getCpf().length() != 11){
				return "RNF-06: O campo CPF deve conter 11 caracteres (somente números)! \nRN-08: Um professor não pode ser cadastrado como pessoa jurídica";
			}
		}		
		return null;
	}
}

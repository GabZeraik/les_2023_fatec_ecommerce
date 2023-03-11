package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Pessoa;

public class ValidadorEnderecoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		Pessoa pessoa = (Pessoa) entidade;
		
		String logradouro = pessoa.getEndereco().getLogradouro();
		String bairro = pessoa.getEndereco().getBairro();
		String cep = pessoa.getEndereco().getCep();
		String estado = pessoa.getEndereco().getCidade().getEstado().getSigla();
		
		if (logradouro == null || logradouro.trim().equals("") || bairro == null || bairro.trim().equals("") || cep == null || cep.trim().equals("") || estado == null || estado.trim().equals("")) {
			return "RN-10: Professores e alunos devem cadastrar o endereço completo.";
		}
		if(estado.length() != 2) return "O estado deve ser preenchido como SIGLA";
		return null;
	}

}

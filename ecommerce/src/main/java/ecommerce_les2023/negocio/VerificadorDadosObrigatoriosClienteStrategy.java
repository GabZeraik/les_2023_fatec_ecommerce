package ecommerce_les2023.negocio;

import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorDadosObrigatoriosClienteStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		List<String> dados_obrigatorios = new ArrayList<>();
		
		if(entidade instanceof Cliente){
			Cliente cliente = (Cliente) entidade;
			dados_obrigatorios.add(cliente.getNome());
			dados_obrigatorios.add(cliente.getCpf());
			dados_obrigatorios.add(cliente.getDta_nascimento());
			dados_obrigatorios.add(cliente.getGenero());
			dados_obrigatorios.add(cliente.getEmail());
			dados_obrigatorios.add(cliente.getSenha());
			
			try {
				dados_obrigatorios.add(cliente.getTelefone().getDdd());
				dados_obrigatorios.add(cliente.getTelefone().getNumero());
				dados_obrigatorios.add(cliente.getTelefone().getTipo());
				cliente.getEndereco();
			} catch (Exception e) {
				return "RN0023 - Todos os campos de cadastro de endereço/telefone são obrigatórios, exceto observação.";
			}
			
			for (EntidadeDominio end : cliente.getEndereco()) {
				VerificadorDadosObrigatoriosEndereco verificadorDadosObrigatoriosEndereco = new VerificadorDadosObrigatoriosEndereco();
				if(verificadorDadosObrigatoriosEndereco.processarStrategy(end) != null) {
					return "RN0023 - Todos os campos de cadastro de endereço são obrigatórios, exceto observação.";
				}
			}
			
			for (String dado : dados_obrigatorios) {
				if(dado == null || dado.trim().equals("")) {
					return "RN0026 - É obrigatório o cadastro dos seguintes dados: Gênero, Nome, Data de Nascimento, CPF, Telefone (deve ser composto pelo tipo, DDD e número), e-mail, senha, endereço residencial.";
				}
			}
		}
		return null;
	}
}

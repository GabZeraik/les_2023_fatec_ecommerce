package ecommerce_les2023.negocio;

import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorDadosObrigatoriosEndereco implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		List<String> dados_obrigatorios = new ArrayList<>();
		
		if(entidade instanceof Endereco){
			Endereco endereco = (Endereco) entidade;
			
			dados_obrigatorios.add(endereco.getTipo());

			if(endereco.getTipo() == "ENTREGA") {
				dados_obrigatorios.add(endereco.getFrase());
			}
			
			dados_obrigatorios.add(endereco.getCep());
			dados_obrigatorios.add(endereco.getBairro());
			dados_obrigatorios.add(endereco.getTipo_logradouro());
			dados_obrigatorios.add(endereco.getLogradouro());
			dados_obrigatorios.add(endereco.getNumero());
			dados_obrigatorios.add(endereco.getResidencia());
			dados_obrigatorios.add(endereco.getCidade().getNome_cidade());
			dados_obrigatorios.add(endereco.getCidade().getEstado().getNome_estado());
			dados_obrigatorios.add(endereco.getCidade().getEstado().getPais().getNome_pais());
			
			for (String dado : dados_obrigatorios) {
				if(dado == null || dado.trim().equals("")) {
					return "RN0023 - Todos os campos de cadastro de endereço são obrigatórios, exceto observação.";
				}
			}
		}
		return null;
	}

}

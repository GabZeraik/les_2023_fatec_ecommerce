package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.AlunoDAO;
import ecommerce_les2023.dao.ClienteDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorEmailCadastradoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Cliente){
			Cliente cliente = (Cliente) entidade;
			Cliente cliente_verificacao = new Cliente();
			cliente_verificacao.setEmail(cliente.getEmail());
			cliente_verificacao.setId(0);
			IDAO clienteDAO = new ClienteDAO();
			List<EntidadeDominio> listaResultado = clienteDAO.consultar(cliente_verificacao);
			
			if(listaResultado.size() > 0) return "RN0000 - Email já cadastrado.";
		}		
		return null;
	}
}

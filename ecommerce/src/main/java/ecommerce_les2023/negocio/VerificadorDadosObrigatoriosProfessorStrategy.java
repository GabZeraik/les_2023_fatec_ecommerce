package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Professor;

public class VerificadorDadosObrigatoriosProfessorStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Professor){
			Professor professor = (Professor)entidade;
			
			String nome = professor.getNome();
			String cpf = professor.getCpf();
			String registro_professor = professor.getRegistro_professor();
			int curso_1_id = professor.getCursos().get(0).getId();
			
			StringBuilder sb = new StringBuilder();
			if(nome == null || nome.trim().equals("") || cpf == null || cpf.trim().equals("") || registro_professor == null || registro_professor.trim().equals("")){
				sb.append("Dados obrigatórios do professor não preenchidos corretamente");
			}
			
			if(curso_1_id == 0 || professor.getCursos().size() > 2) sb.append("RN-02: Todo professor deve estar vinculado a pelo menos 1 curso e no máximo 2");
			
			ValidadorEnderecoStrategy validadorEndereco = new ValidadorEnderecoStrategy();
			String retornoStrategy = validadorEndereco.processarStrategy(professor);
			
			if(retornoStrategy != null) {
				sb.append(retornoStrategy);
			}
			
			if(sb != null) {
				return sb.toString();
			}
		}
		return null;
	}
}



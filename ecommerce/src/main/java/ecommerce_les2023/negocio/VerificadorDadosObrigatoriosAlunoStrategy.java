package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorDadosObrigatoriosAlunoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Aluno){
			Aluno aluno = (Aluno)entidade;
			
			String nome = aluno.getNome();
			String cpf = aluno.getCpf();
			
			String data_nascimento = aluno.getDta_nascimento();
			String registro_aluno = aluno.getRegistro_aluno();
			
			int curso_id = aluno.getCurso().getId();
			
			if(nome == null || nome.trim().equals("") || cpf == null || cpf.trim().equals("") || registro_aluno == null || registro_aluno.trim().equals("") || data_nascimento == null || data_nascimento.trim().equals("")){
				return "RN-09: Todos os dados do aluno são obrigatórios";
			}else if(curso_id == 0) return "RN-05: Todo aluno deve ser cadastrado em um curso e somente um";
			
			ValidadorEnderecoStrategy validadorEndereco = new ValidadorEnderecoStrategy();
			String retornoStrategy = validadorEndereco.processarStrategy(aluno);
			
			if(retornoStrategy != null) return retornoStrategy;
			
		}
		return null;
	}
}

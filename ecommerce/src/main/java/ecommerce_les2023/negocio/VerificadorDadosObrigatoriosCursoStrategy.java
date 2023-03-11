package ecommerce_les2023.negocio;

import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorDadosObrigatoriosCursoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Curso){
			Curso curso = (Curso)entidade;
			
			String nome = curso.getNome_curso();
			String periodo = curso.getPeriodo();
			
			if(nome == null || nome.trim().equals("") || periodo == null || periodo.trim().equals("")){
				return "Dados obrigatórios do curso não preenchidos corretamente";
			}
		}
		return null;
	}
}



package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ProfessorDAO;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Professor;

public class VerificadorRfProfessorStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Professor){
			Professor professor = (Professor) entidade;
			Professor professor_verificacao = new Professor();
			professor_verificacao.setCpf(professor.getRegistro_professor());
			professor_verificacao.setId(0);
			IDAO professorDao = new ProfessorDAO();
			List<EntidadeDominio> listaResultado = professorDao.consultar(professor_verificacao);
			if(listaResultado.size() > 0) return "RN-06: Todo professor deve ter um registro de professor único e distinto.";
		}		
		return null;
	}

}

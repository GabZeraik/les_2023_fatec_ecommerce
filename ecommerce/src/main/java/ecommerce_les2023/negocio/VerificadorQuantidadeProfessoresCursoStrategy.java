package ecommerce_les2023.negocio;

import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.dao.ProfessorDAO;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Professor;

public class VerificadorQuantidadeProfessoresCursoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		IDAO professorDao = new ProfessorDAO();
		Professor professor = (Professor) entidade;
		Curso curso = new Curso();
		curso.setId(professor.getCursos().get(0).getId());
		Professor professor_verificacao = new Professor();
		
		List<Curso> listaCursos = new ArrayList<Curso>();
		listaCursos.add(curso);
		if(professor.getCursos().size() > 1) {
			Curso curso2 = new Curso();
			curso.setId(professor.getCursos().get(1).getId());
			listaCursos.add(curso2);
		} 
		
		professor_verificacao.setCursos(listaCursos);
		List<EntidadeDominio> listaResultado = professorDao.consultar(professor_verificacao);
		if(listaResultado.size() > 0) return "RN-01: O curso deve ter no máximo 1 professor cadastrado.";
		
		return null;
	}

}

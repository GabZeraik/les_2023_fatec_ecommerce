package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.CursoDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Professor;

public class VerificadorExistenciaCursoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		StringBuilder sb = new StringBuilder();
		Curso curso_verificacao = new Curso();
		IDAO cursoDao = new CursoDAO();
		if(entidade instanceof Aluno){
			Aluno aluno = (Aluno) entidade;
			
			curso_verificacao.setId(aluno.getCurso().getId());
			List<EntidadeDominio> listaResultado = cursoDao.consultar(curso_verificacao);
			
			if(listaResultado.size() == 0) sb.append("RN-05: Todo aluno deve ser cadastrado em um curso e somente um. CURSO INEXISTENTE");
			else {
				VerificadorQuantidadeAlunosCursoStrategy verificadorQuantidade = new VerificadorQuantidadeAlunosCursoStrategy();
				String retornoStrategy = verificadorQuantidade.processarStrategy(aluno);
				
				if(retornoStrategy != null) {
					sb.append(retornoStrategy);
				}
			}
			
		}else if(entidade instanceof Professor){
			Professor professor = (Professor) entidade;
			
			curso_verificacao.setId(professor.getCursos().get(0).getId());
			List<EntidadeDominio> listaResultado = cursoDao.consultar(curso_verificacao);
			
			if(listaResultado.size() == 0) sb.append("RN-02: Todo professor deve estar vinculado a pelo menos 1 curso e no máximo 2. CURSO 1 INEXISTENTE");
			if(professor.getCursos().size() > 1 && professor.getCursos().get(1).getId() != 0) {
				curso_verificacao.setId(professor.getCursos().get(1).getId());
				listaResultado = cursoDao.consultar(curso_verificacao);
				if(listaResultado.size() == 0) sb.append("RN-02: Todo professor deve estar vinculado a pelo menos 1 curso e no máximo 2. CURSO 2 INEXISTENTE");
			}
			
			VerificadorQuantidadeProfessoresCursoStrategy verificadorQuantidade = new VerificadorQuantidadeProfessoresCursoStrategy();
			String retornoStrategy = verificadorQuantidade.processarStrategy(professor);
			
			if(retornoStrategy != null) {
				sb.append(retornoStrategy);
			}
				
		}else if(entidade instanceof Curso){
			System.out.println("ENTROU NA STRATEGY VerificadorExistenciaCursoStrategy");
			Curso curso = (Curso) entidade;
			List<EntidadeDominio> listaResultado = cursoDao.consultar(curso);
			if(listaResultado.size() > 0) sb.append("RN-11: Cursos não podem ter o mesmo nome e período.");
		}
		System.out.println("SB TO STRING" + sb.toString());
		return sb.toString();
	}
}

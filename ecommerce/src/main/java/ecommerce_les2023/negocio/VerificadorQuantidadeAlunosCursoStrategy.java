package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.AlunoDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorQuantidadeAlunosCursoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		IDAO alunoDao = new AlunoDAO();
		Aluno aluno = (Aluno) entidade;
		Curso curso = new Curso();
		curso.setId(aluno.getCurso().getId());
		Aluno aluno_verificacao = new Aluno();
		aluno_verificacao.setCurso(curso);
		List<EntidadeDominio> listaResultado = alunoDao.consultar(aluno_verificacao);
		if(listaResultado.size() > 2) return "RN-01: O curso deve ter no máximo 3 alunos cadastrados.";
		
		return null;
	}

}

package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.AlunoDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorRaAlunoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Aluno){
			Aluno aluno = (Aluno) entidade;
			Aluno aluno_verificacao = new Aluno();
			aluno_verificacao.setRegistro_aluno(aluno.getRegistro_aluno());
			IDAO alunoDao = new AlunoDAO();
			List<EntidadeDominio> listaResultado = alunoDao.consultar(aluno_verificacao);
			if(listaResultado.size() > 0) return "RN-06: Todo aluno deve ter um registro de aluno único e distinto.";
		}		
		return null;
	}

}

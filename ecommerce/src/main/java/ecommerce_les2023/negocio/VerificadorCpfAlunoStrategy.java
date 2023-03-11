package ecommerce_les2023.negocio;

import java.util.List;

import ecommerce_les2023.dao.AlunoDAO;
import ecommerce_les2023.dao.IDAO;
import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorCpfAlunoStrategy implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		if(entidade instanceof Aluno){
			Aluno aluno = (Aluno) entidade;
			Aluno aluno_verificacao = new Aluno();
			aluno_verificacao.setCpf(aluno.getCpf());
			aluno_verificacao.setId(0);
			IDAO alunoDao = new AlunoDAO();
			List<EntidadeDominio> listaResultado = alunoDao.consultar(aluno_verificacao);
			if(listaResultado.size() > 0) return "RN-03: É permitido cadastrar somente um aluno/professor por CPF";
		}		
		return null;
	}
}

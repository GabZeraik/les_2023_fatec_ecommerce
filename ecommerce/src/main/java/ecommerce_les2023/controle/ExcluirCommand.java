package ecommerce_les2023.controle;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;

public class ExcluirCommand extends AbstractCommand{

	@Override
	public Resultado execute(EntidadeDominio entidade) {
		return fachada.excluir(entidade);
	}
}

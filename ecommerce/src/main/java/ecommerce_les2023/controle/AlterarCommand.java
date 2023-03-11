package ecommerce_les2023.controle;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;

public class AlterarCommand extends AbstractCommand{

	@Override
	public Resultado execute(EntidadeDominio entidade) {
		return fachada.alterar(entidade);
	}

}

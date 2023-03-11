package ecommerce_les2023.controle;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;

public interface ICommand {
	public Resultado execute(EntidadeDominio entidade);
}

package ecommerce_les2023.controle;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;

public interface IFachada {
	public Resultado salvar(EntidadeDominio entidade);
	public Resultado excluir(EntidadeDominio entidade);
	public Resultado alterar(EntidadeDominio entidade);
	public Resultado consultar(EntidadeDominio entidade);
}

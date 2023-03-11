package ecommerce_les2023.dao;

import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;

public interface IDAO {

	public void salvar(EntidadeDominio entidade);
	public void alterar(EntidadeDominio entidade);
	public void deletar(EntidadeDominio entidade);
	public List<EntidadeDominio> consultar(EntidadeDominio entidade);
}

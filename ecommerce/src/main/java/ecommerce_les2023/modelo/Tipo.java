package ecommerce_les2023.modelo;

public class Tipo {
	private String cod_tipo;
	private String nome_tipo;

	public Tipo(String nome_tipo) {
		this.nome_tipo = nome_tipo;
	}
	public String getCod_tipo() {
		return cod_tipo;
	}
	public void setCod_tipo(String cod_tipo) {
		this.cod_tipo = cod_tipo;
	}
	public String getNome_tipo() {
		return nome_tipo;
	}
	public void setNome_tipo(String nome_tipo) {
		this.nome_tipo = nome_tipo;
	}
}

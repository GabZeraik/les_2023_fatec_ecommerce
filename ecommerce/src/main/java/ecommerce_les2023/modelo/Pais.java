package ecommerce_les2023.modelo;

public class Pais {

	private String sigla;
	private String nome_pais;
	
	public Pais(String sigla, String nome) {
		this.nome_pais = nome;
		this.sigla = sigla;
	}

	public String getSigla() {
		return this.sigla;
	}

	public String getNome_pais() {
		return this.nome_pais;
	}

}

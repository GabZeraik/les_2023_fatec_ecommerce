package ecommerce_les2023.modelo;

public class Estado {

	private String sigla;
	private String nome_estado;
	private Pais pais;
	
	public Estado(String sigla, String nome, Pais pais) {
		this.nome_estado = nome;
		this.sigla = sigla;
		this.pais = pais;
	}

	public String getSigla() {
		return this.sigla;
	}

	public String getNome_estado() {
		return this.nome_estado;
	}

	public Pais getPais() {
		return pais;
	}

}

package ecommerce_les2023.modelo;

public class Cidade {

	private String nome_cidade;
	private Estado estado;
	
	public Cidade(String nome_cidade, Estado estado) {
		this.nome_cidade = nome_cidade;
		this.estado = estado;
	}

	public String getNome_cidade() {
		return nome_cidade;
	}

	public Estado getEstado() {
		return estado;
	}
	
}

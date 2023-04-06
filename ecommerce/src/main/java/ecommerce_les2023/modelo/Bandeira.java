package ecommerce_les2023.modelo;

public class Bandeira extends EntidadeDominio{
	
	private String cod_bandeira;
	private String nome;
		
	public Bandeira(int id, String cod_bandeira, String nome) {
		this.cod_bandeira = cod_bandeira;
		this.nome = nome;
		super.id = id;
	}
	
	public Bandeira(int id) {
		super.id = id;
	}
	
	public Bandeira() {
		
	}

	public String getCod_bandeira() {
		return cod_bandeira;
	}
	public void setCod_bandeira(String cod_bandeira) {
		this.cod_bandeira = cod_bandeira;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
}
